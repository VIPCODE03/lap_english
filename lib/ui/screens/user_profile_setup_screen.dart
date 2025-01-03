import 'package:flutter/material.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/ui/screens/main_screen.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:lap_english/ui/widgets/other/scaffold.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  late List<Widget> infos;
  final Map<String, List<String>> selectedInfo = {
    'Sở thích': [],
    'Nghề nghiệp': [],
    'Tuổi': [],
  };
  final List<String> _infoHobbyList = [
    'Chơi game',
    'Nghe nhạc',
    'Đọc sách',
    'Xem phim',
    'Thể thao',
    'Du lịch',
    'Nấu ăn',
    'Vẽ tranh',
    'Chụp ảnh',
    'Khác'
  ];
  final List<String> careers = [
    'Học sinh',
    'Sinh viên',
    'Giáo viên',
    'Lập trình viên',
    'Bác sĩ',
    'Kế toán',
    'Phiên dịch viên',
    'Nhân viên bán hàng',
    'Luật sư',
    'Khác'
  ];
  final List<String> ageGroups = [
    'Dưới 18 tuổi',
    '18 - 24 tuổi',
    '25 - 34 tuổi',
    '35 - 44 tuổi',
    'Trên 44 tuổi',
  ];
  final List<bool> statusSelectItems = [false, false, false];

  int index = 0;
  bool next = false;

  @override
  void initState() {
    super.initState();
    infos = [
      _Item('Bạn bao nhiêu tuổi?', ageGroups, selectedInfo['Tuổi']!, false, statusSelectItems, 0),
      _Item('Sở thích của bạn là gì?', _infoHobbyList, selectedInfo['Sở thích']!, true, statusSelectItems, 1),
      _Item('Bạn đang là?', careers, selectedInfo['Nghề nghiệp']!, false, statusSelectItems, 2),
    ];
    hasChanged.addListener(_updateScreen);
  }

  @override
  void dispose() {
    hasChanged.removeListener(_updateScreen);
    super.dispose();
  }

  void _updateScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WdgScaffold(
        body: Column(
          children: [
            const SizedBox(height: 66),

            /// Slide chọn thông tin  ------------------------------------------
            Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 666),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    var right = const Offset(1, 0.0);
                    var left = const Offset(-10.0, 0.0);
                    const center = Offset.zero;
                    next =! next;

                    var tween = Tween(
                        begin: next ? right : left,
                        end: center
                    ).chain(CurveTween(curve: Curves.easeInOutCubic));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                  child: SizedBox(
                    key: ValueKey(index),
                    child: SingleChildScrollView(
                      child: infos[index],
                    )
                  ),
                )),

            /// Button chuyển tiếp  --------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: maxWidth / 2.5,
                  margin: const EdgeInsets.all(12),
                  child: WdgButton(
                      onTap: () {
                        if(index > 0) {
                          setState(() {
                            next = false;
                            index--;
                          });
                        }
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: const Text('Trước', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      )
                  ),
                ),

                Container(
                  height: 50,
                  width: maxWidth / 2.5,
                  margin: const EdgeInsets.all(12),
                  child: WdgButton(
                      onTap: () {
                        if(statusSelectItems[index]) {
                          setState(() {
                            next = true;
                            if(index < infos.length - 1) {
                              index++;
                            }
                            else {
                              List<String> infos = [];
                              for(var key in selectedInfo.keys) {
                                infos.add('$key ${selectedInfo[key]}');
                              }
                              CacheManager().saveInfoUser(infos);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                            }
                          });
                        }
                        else {
                          return;
                        }
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: const Text('Tiếp', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      )
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}

/// ITEM  ----------------------------------------------------------------------
class _Item extends StatefulWidget {
  final String title;
  final List<String> items;
  final List<String> itemsSelect;
  final bool multipleSelect;
  final List<bool> statusSelectItem;
  final int index;

  const _Item(this.title, this.items, this.itemsSelect, this.multipleSelect, this.statusSelectItem, this.index);

  @override
  State<StatefulWidget> createState() => _ItemState();
}

class _ItemState extends State<_Item> {

  //=== Sự kiện chọn item ===
  void _toggleSelection(String element) {
    setState(() {
      if (widget.itemsSelect.contains(element)) {
        widget.itemsSelect.remove(element);
      } else {
        if (widget.multipleSelect) {
          widget.itemsSelect.add(element);
        } else {
          widget.itemsSelect.clear();
          widget.itemsSelect.add(element);
        }
      }
      widget.statusSelectItem[widget.index] = widget.itemsSelect.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Tiêu đề ---------------------------------------------------------
        Text(widget.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
        ),

        /// Danh sách item  ---------------------------------------------------
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: widget.items.map((element) {
            bool isSelected = widget.itemsSelect.contains(element);

            return Container(
              padding: const EdgeInsets.all(6),
              height: 66,
              width: 166,
              child: WdgButton(
                onTap: () {
                  _toggleSelection(element);
                },
                alpha: isSelected ? 66 : 6,
                borderRadius: BorderRadius.circular(12),
                child: Text(
                  element,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
