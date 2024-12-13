import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_english/bloc/data_bloc/data_bloc.dart';
import 'package:lap_english/data/model/learn/status.dart';
import 'package:lap_english/data/model/user/user.dart';
import 'package:lap_english/gen/assets.gen.dart';
import 'package:lap_english/ui/dialogs/dialog_widget.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/special_text.dart';

import '../../../themes/size.dart';

class WdgStatusLock<T> extends StatefulWidget {
  final T item;
  final MdlUnlockStatusManager status;
  final Widget child;

  const WdgStatusLock({
    super.key,
    required this.item,
    required this.status,
    required this.child
  });

  @override
  State<StatefulWidget> createState() => _WdgStatusLockState<T>();
}

class _WdgStatusLockState<T> extends State<WdgStatusLock> {
  late MdlUnlockStatusManager status;
  late bool isFree;

  @override
  void initState() {
    super.initState();
    status = widget.status;
    isFree = (status.gold == 0 && status.diamond == 0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;
          double iconSize = width < height ? width * 0.1 : height * 0.1;

          return Stack(
            children: [
              Opacity(
                opacity: isFree ? 1 : status.isLocked ? 0.3 : 1,
                  child: GestureDetector(
                    onTap: () => isFree ? null : status.isLocked ? _unLockDialog(context) : null,
                    child: AbsorbPointer(
                      absorbing: isFree ? false : status.isLocked,
                      child: widget.child,
                  ),
                ),
              ),

              Positioned(
                top: 1,
                right: 1,
                left: 1,
                bottom: 1,
                child: isFree
                    ? const SizedBox.shrink()
                    : status.isLocked
                    ? Icon(Icons.lock, size: iconSize, color: Colors.grey)
                    : const SizedBox.shrink(),
              ),
            ]);
    });
  }

  void _unLockDialog(BuildContext parentContext) {
    showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return WdgDialog(
              crossAxisAlignment: CrossAxisAlignment.center,
              title: const Text('Mở khóa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              content: const Center(child: Icon(Icons.lock_open, size: 50)),
              width: isPortrait ? maxWidth - 50 : maxWidth - 100,
              actions: [
                MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => DataBloc<User>()..add(DataEventLoad<User>())),
                      BlocProvider(create: (context) => DataBloc<T>())
                    ],
                    child: BlocBuilder<DataBloc<User>, DataState>(
                        builder: (context, state) {
                          if (state is DataStateLoaded<User>) {
                            var user = state.data.first;

                            return Column(
                              children: [
                                WdgSpecialText(text: 'Bạn đang có <${user.cumulativePoint.gold}> vàng và <${user.cumulativePoint.diamond}> kim cương'),

                                SizedBox(
                                    width: 200,
                                    child: WdgButton(
                                        onTap: () {
                                          if(status.unlock(user)) {
                                            setState(() {
                                              context.read<DataBloc<User>>().add(DataEventUpdate<User>(datas: [user]));
                                              context.read<DataBloc<T>>().add(DataEventUpdate<T>(datas: [widget.item], headers: {'unlock' : true}));
                                            });
                                          }
                                          Navigator.of(context).pop();
                                        },
                                        borderRadius: BorderRadius.circular(12),
                                        child: Wrap(
                                          spacing: 5,
                                          children: [
                                            if(status.gold > 0)
                                              _itemPrice(context, Assets.images.icon.gold.path, '${status.gold}', user.cumulativePoint.gold >= status.gold),

                                            if(status.diamond > 0)
                                              _itemPrice(context, Assets.images.icon.dimound.path, '${status.diamond}', user.cumulativePoint.diamond >= status.diamond),
                                          ],
                                        )
                                    ))
                              ],
                            );
                          }

                          return const SizedBox.shrink();
                        })
                )
              ]
          );
        }
    );
  }

  Widget _itemPrice(BuildContext context, String imgUrl, String price, bool enough) {
    return Wrap(spacing: 3, children: [
      Image.asset(
        imgUrl,
        width: 25,
        height: 25,
      ),

      Text(price,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: enough ? Colors.green : Colors.red
          ))
        ]
    );
  }
}