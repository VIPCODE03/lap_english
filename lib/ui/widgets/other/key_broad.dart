
import 'package:flutter/material.dart';
import 'package:lap_english/main.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';
import 'package:lap_english/ui/widgets/other/button.dart';

class WdgKeyBroad extends StatefulWidget {
  final ValueChanged<String> onValueChanged;
  final String suggest;
  final int maxLength;

  const WdgKeyBroad({
    super.key,
    required this.onValueChanged,
    this.suggest = '',
    this.maxLength = 0,
  });

  @override
  State createState() => _WdgKeyBroadState();
}

class _WdgKeyBroadState extends State<WdgKeyBroad> {
  String typedText = '';
  String keySuggest = '';
  bool suggest = false;

  @override
  void initState() {
    super.initState();

    if (widget.suggest.isNotEmpty) {
      keySuggest = widget.suggest[0];
    }

    hasChanged.addListener(update);
  }

  @override
  void dispose() {
    super.dispose();
    hasChanged.removeListener(update);
  }

  void update() {
    setState(() {});
  }

  //=== Nhập bàn phím ===
  void _onKeyPressed(String key) {
    if (key == '←') {
      if (typedText.isNotEmpty) {
        typedText = typedText.substring(0, typedText.length - 1);
      }
    } else {
      if (widget.suggest != '' && suggest) {
        if(key == keySuggest) {
          typedText += key;
        }
      } else if(widget.maxLength == 0 || typedText.length < widget.maxLength) {
        typedText += key;
      }
    }
    widget.onValueChanged.call(typedText);

    if (suggest) {
      _suggest();
    }
  }

  //=== Gợi ý ===
  void _suggest() {
    setState(() {
      var a = widget.suggest.replaceFirst(typedText, '');
      if(a.isNotEmpty) {
        keySuggest = a[0];
      }
      else {
        keySuggest = '';
      }
    });
  }

  //=== Sửa gợi ý ===
  String _compareStrings(String str1, String str2) {
    int minLength = str1.length < str2.length ? str1.length : str2.length;
    String result = '';

    for (int i = 0; i < minLength; i++) {
      if (str1[i] == str2[i]) {
        result += str1[i];
      } else {
        break;
      }
    }

    return result;
  }

  final List<List<String>> keyboardLayout = [
    ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
    ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M', '←',],
    [' '],
  ];

  final List<List<String>> keyboardLayoutLower = [
    ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
    ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
    ['z', 'x', 'c', 'v', 'b', 'n', 'm', '←'],
    [' '],
  ];

  @override
  Widget build(BuildContext context) {
    final buttonHeight = orientation == Orientation.portrait ? maxHeight * 0.05 : maxHeight * 0.07;
    final buttonWidth = orientation == Orientation.portrait ? maxWidth / 10.5 : maxWidth / 10.5 / 1.5;

    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(widget.suggest.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: WdgButton(
                  onTap: () {
                    setState(() {
                      setState(() {
                        if (suggest) {
                          suggest = false;
                        } else {
                          suggest = true;
                          if (widget.suggest.isNotEmpty) {
                            typedText =
                                _compareStrings(widget.suggest, typedText);
                            _suggest();
                          } else {
                            keySuggest = '';
                          }
                        }
                      });
                    });
                  },
                  color: Colors.transparent,
                  child: Text(suggest ? 'Tắt gợi ý' : 'gợi ý',
                    style: const TextStyle(fontSize: 16, color: Colors.amber),
                  )
              ),
            ),
          ...keyboardLayoutLower.map((row) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((key) => _itemKey(key, buttonWidth, buttonHeight)).toList(),
            ),
          )),
        ],
      ),
    );
  }

  /// Item bàn phím -------------------------------------------------
  Widget _itemKey(String key, double width, double height) {
    return Container(
      height: height,
      width: key == ' '
          ? width * 5
          :  key == '←'
          ? width * 1.2
          : width,
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: WdgButton(
        color: VipColors.onPrimary(context),
        alpha: keySuggest.toLowerCase() == key.toLowerCase() && suggest
            ? 100
            : 10,
        borderRadius: BorderRadius.circular(12),
        buttonFit: ButtonFit.scaleDown,
        onTap: () => _onKeyPressed(key),
        child: Text(
          key == 'SPACE' ? ' ' : key,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
