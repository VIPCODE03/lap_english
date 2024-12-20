import 'package:flutter/material.dart';
import 'package:lap_english/data/caching/cache_manager.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/dialogs/dialog_widget.dart';
import 'package:lap_english/ui/themes/size.dart';
import 'package:lap_english/ui/widgets/other/button.dart';
import 'package:provider/provider.dart';
import '../../../themes/themes.dart';
import 'item_setting.dart';

class WdgDisplaySettings extends StatefulWidget {
  final CacheManager cacheManager;

  const WdgDisplaySettings({super.key, required this.cacheManager});

  @override
  State<StatefulWidget> createState() => _WdgDisplaySettingsState();
}

class _WdgDisplaySettingsState extends State<WdgDisplaySettings> {
  @override
  Widget build(BuildContext context) {
    var themeVip = Provider.of<Themes>(context, listen: false);
    return WdgItemNavSetting(
        title: 'Giao diện',
        options: [
          WdgItemButtonNavSetting(icon: Icons.light_mode_outlined,text: 'Chế độ', funSetting: null, action: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: VipColors.onPrimary(context), width: 1.5)
                ),
                child: _itemSelectMode(themeVip.vipTheme.themeMode),
              ),

              SizedBox(
                height: 30,
                width: 100,
                child: Opacity(opacity: 0,
                    child: DropdownButton<ThemeMode>(
                      items: <ThemeMode>[
                        ThemeMode.system, ThemeMode.light, ThemeMode.dark
                      ].map<DropdownMenuItem<ThemeMode>>((ThemeMode value) {
                        return DropdownMenuItem<ThemeMode>(
                          value: value,
                          child: _itemSelectMode(value),
                        );
                      }).toList(),
                      onChanged: (Object? value) {
                        setState(() {
                          themeVip.updateThemeMode(value as ThemeMode);
                        });
                      },
                    )
                ),
              )
            ],
          )),

          WdgItemButtonNavSetting(icon: Icons.text_format,text: 'Kiểu chữ', funSetting: showDialogFont),

          WdgItemButtonNavSetting(icon: Icons.text_fields,text: 'Kích cỡ chữ', funSetting: showDialogFont),
        ]
    );
  }

  /// Item chọn chế độ sáng tối ---------------------------------------------------
  Widget _itemSelectMode(ThemeMode themeMode) {
    String label;
    IconData icon;
    switch(themeMode) {
      case ThemeMode.system:
        label = 'hệ thống';
        icon = Icons.brightness_6;
        break;
      case ThemeMode.light:
        label = 'sáng';
        icon = Icons.light_mode;
        break;

      case ThemeMode.dark:
        label = 'tối';
        icon = Icons.dark_mode;
        break;
    }
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: VipColors.primary(context)),
          const SizedBox(width: 5),
          Text(label, style: TextStyle(fontSize: textSize.normal, color: Colors.grey))
        ]);
  }

  /// Dialog tùy chỉnh kích cỡ chữ  ----------------------------------------------
  void showDialogFont() {
    double currentScale = ((widget.cacheManager.getScale() - 1) / 0.3) * 100;
    double newScale = 1;
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) {
                return WdgDialog(
                    title: Text('Chọn kích cỡ chữ', style: TextStyle(fontSize: textSize.medium)),
                    content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Slider(
                              activeColor: VipColors.onPrimary(context),
                              secondaryActiveColor: VipColors.onPrimary(context),
                              value: currentScale.clamp(0.0, 100),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              onChanged: (double value) {
                                setState(() {
                                  newScale = 1.0 + 0.3 * value / 100;
                                  textSize.update(newScale);
                                  currentScale = value;
                                });
                              },
                            ),
                          ],
                    ),
                    actions: [
                      WdgButton(
                          onTap: () => Navigator.pop(context, false),
                          color: Colors.transparent,
                          child: Text('Hủy', style: TextStyle(fontSize: textSize.medium, color: Colors.red))
                      ),

                      WdgButton(
                          onTap: () {
                            widget.cacheManager.saveScale(newScale);
                            hasChanged.value = !hasChanged.value;
                            Navigator.pop(context, true);
                          },
                          color: Colors.transparent,
                          child: Text('Xác nhận', style: TextStyle(fontSize: textSize.medium, color: Colors.green))
                      )
                    ]
                );
              });
        }
    ).then((value) {
      textSize.update(widget.cacheManager.getScale());
    });
  }
}
