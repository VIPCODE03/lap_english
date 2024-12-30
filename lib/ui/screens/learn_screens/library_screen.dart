import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/app_bar.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

import '../../themes/size.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late TextEditingController _editingController;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
      appBar: const WdgAppBar(title: 'Thư viện'),
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = true;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isExpanded ? maxWidth * 0.9 : maxWidth * 0.6,
                height: 50,
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: VipColors.onPrimary(context),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    if (isExpanded)
                      Expanded(
                        child: TextField(
                          controller: _editingController,
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tìm kiếm...',
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              isExpanded = false;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              )
          ),

          SizedBox(
            height: 66,
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              indicatorColor: VipColors.onPrimary(context),
              labelColor: VipColors.text(context),
              isScrollable: true,
              splashBorderRadius: BorderRadius.circular(12),
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(text: 'Từ vựng'),
                Tab(text: 'Câu'),
                Tab(text: 'Ngữ pháp'),
                Tab(text: 'Trò chuyện'),
                Tab(text: 'Truyện'),
              ],
            ),
          ),

          Expanded(child: TabBarView(
            controller: _tabController,
            children: const [
              Center(child: Text('Từ vựng content')),
              Center(child: Text('Câu content')),
              Center(child: Text('Ngữ pháp content')),
              Center(child: Text('Trò chuyện content')),
              Center(child: Text('Truyện content')),
            ],
          )),
        ],
      ),
    );
  }
}
