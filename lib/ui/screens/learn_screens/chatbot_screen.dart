
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/services/bot.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../data/model/learn/chat.dart';

class ChatBotScreen extends StatefulWidget {
  final MdlTopicChat topicChat;

  const ChatBotScreen({super.key, required this.topicChat});

  @override
  State<StatefulWidget> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<MdlChat> chats = [];
  final GeminiAI gemini = GeminiAI(model: GeminiAI.flash_8b);
  final List<RegExpMatch> suggests = [];
  bool isBilingual = true;

  @override
  void initState() {
    super.initState();
    _train();
  }

  void _train() async {
    var textTrain = await rootBundle.loadString(Assets.trainbot.chat);
    gemini.train(textTrain);
    gemini.train(widget.topicChat.describe);
    _send('Start');
  }

  //=== gửi tin nhắn  ===
  void _send(String mess) async {
    setState(() {
      chats.add(MdlChat(RoleChat.user, mess.trim(), ''));
    });
    _controller.clear();
    _scrollToBottom();

    var messBot = await gemini.chat('$mess'
        ' \n<Note: Hãy nhớ cấu trúc tin nhắn và 2 gợi ý nhé!') ?? '';
    for(var chat in _messBots(messBot)) {
      if(chat != null) {
        var newChat = MdlChat(RoleChat.bot, '', '');
        setState(() {
          chats.add(newChat);
          _scrollToBottom();
        });
        int delay = 1000 + Random().nextInt(500);
        await Future.delayed(Duration(milliseconds: delay));
        setState(() {
          chats.remove(newChat);
          chats.add(chat);
        });
      }
    }
    setState(() {
      _suggest(messBot);
    });
    _scrollToBottom();
  }

  //=== Lấy dữ liệu tin nhắn  bot ===
  List<MdlChat?> _messBots(String mess) {
    RegExp reg = RegExp(r'(\d+)->(.*?)<->(.*?)>>');
    return reg.allMatches(mess).map((match) {
      if (match.groupCount >= 3) {
        String? message = match.group(2);
        String? translate = match.group(3);

        if (message != null && translate != null) {
          return MdlChat(RoleChat.bot, message.trim(), translate.trim());
        }
      }
      return null;
    }).where((item) => item != null).toList();
  }

  //=== Tách gợi ý  ===
  void _suggest(String mess) {
    RegExp reg = RegExp(r'<suggest>(.*?)<->(.*?)>>');

    reg.allMatches(mess).forEach((match) {
      if (match.groupCount >= 2) {
        suggests.add(match);
      }
    });
  }

  //=== Cuộn  ===
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        appBar: WdgAppBar(
          title: 'Trò chuyện',
          actions: [
            WdgButton(
                onTap: () {
                  setState(() {
                    isBilingual = !isBilingual;
                  });
                  _scrollToBottom();
                },
                color: Colors.transparent,
                child: const Icon(Icons.edit_road_sharp)
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// Text chủ đề ---------------------------------------------------
              Text(widget.topicChat.name, style: TextStyle(fontSize: 20, color: VipColors.text(context))),

              /// Danh sách tin nhắn  --------------------------------------------
              Expanded(child: Stack(
                children: [
                  /// Ảnh -------------------------------------------------------
                  Center(child: Opacity(
                      opacity: 0.66,
                      child: Image.network(widget.topicChat.imgUrl)
                  )),

                  /// Listview tin nhắn ------------------------------------------
                  Column(
                    children: [
                      Expanded(child: ListView.builder(
                          controller: _scrollController,
                          itemCount: chats.length,
                          itemBuilder: (context, index) {
                            bool roleUser = chats[index].roleChat == RoleChat.user;
                            return Align(
                              alignment: roleUser
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                constraints:
                                BoxConstraints(maxWidth: maxWidth * 0.8),
                                decoration: BoxDecoration(
                                    color: roleUser
                                        ? VipColors.primary(context)
                                        : VipColors.onPrimary(context),
                                    borderRadius: BorderRadius.only(
                                        topRight: const Radius.circular(16),
                                        topLeft: const Radius.circular(16),
                                        bottomLeft: Radius.circular(roleUser ? 16 : 5),
                                        bottomRight: Radius.circular(roleUser ? 5 : 16))
                                ),
                                padding: const EdgeInsets.all(6.6),
                                margin: const EdgeInsets.all(6.6),
                                  child: chats[index].message.isNotEmpty
                                      ? Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(chats[index].message,
                                                  style: const TextStyle(
                                                      fontSize: 16)),
                                              if (!roleUser &&
                                                  chats[index]
                                                      .translate
                                                      .isNotEmpty && isBilingual)
                                                Text(
                                                    '---\n ${chats[index].translate}'),
                                            ],
                                          )
                                      : SizedBox(
                                              height: 25,
                                              child: Image(image: Assets.images.icon.a3Dot.provider()),
                                    )
                              ),
                            );
                          })
                      ),
                      
                      Container(
                        color: VipColors.onPrimary(context),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        height: 2,
                        width: maxWidth * 0.66,
                      ),

                      if(suggests.isNotEmpty)
                        Wrap(
                          spacing: 10,
                          runSpacing: 5,
                          children: [
                            ...suggests.map((suggest) => WdgButton(
                              onTap: () {
                                setState(() {
                                  _controller.text = suggest.group(1)!.trim();
                                });
                              },
                              buttonFit: ButtonFit.scaleDown,
                              child: Text('${suggest.group(1)!.trim()} \n ${isBilingual ? suggest.group(2)!.trim() : ''}'.trim()),
                            ))
                          ],
                        )
                    ],
                  ),
                ])
              ),

              /// Ô nhập và gửi tin nhắn  --------------------------------------------
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      constraints: const BoxConstraints(maxHeight: 150),
                      child: TextField(
                        controller: _controller,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Nhập tin nhắn',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                    )),

                    WdgButton(
                        onTap: () {
                          if(_controller.text.isNotEmpty) {
                            setState(() {
                              suggests.clear();
                            });
                            _send(_controller.text);
                          }
                        },
                        color: Colors.transparent,
                        child: Icon(Icons.send, color: VipColors.primary(context)))
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
