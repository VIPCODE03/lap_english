import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../ui/colors/vip_colors.dart';
import '../ui/dialogs/dialog_widget.dart';
import '../ui/themes/size.dart';

final Connectivity _connectivity = Connectivity();
late BuildContext? _context;
bool _isShow = false;
final ValueNotifier<bool> _onChanged = ValueNotifier(false);

//=== Khởi tạo lắng nghe ===
Future<void> initConnectivity() async {
  _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  _onChanged.addListener(() {
  });
  try {
    await _connectivity.checkConnectivity();
  } on PlatformException catch (e) {
    debugPrint('Couldn\'t check connectivity status $e');
  }

  return;
}

//=== Kiểm tra và cập nhật  ===
Future<void> checkInternet() async {
  _updateConnectionStatus;
}

//=== show  ===
void _showDialogNetwork() {
  final context = navigatorKey.currentState?.overlay?.context;
  if (context != null) {
    _isShow = true;
    /// Show dialog thông báo rớt mạng  --------------------------------------------
    showDialog(
        context: context,
        builder: (context) {
          _context = context;
          return WdgDialog(
            barrierDismissible: false,
            title: Text('Mất trạng thái kết nối', style: TextStyle(fontSize: textSize.title, color: VipColors.text(context))),
            content: null,
            shadow: true,
            border: true,
          );
        }
    );
  }
}

//=== Cập nhật trạng thái ===
Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
  if (result.contains(ConnectivityResult.none)) {
    _showDialogNetwork();
  }
  else {
    if (!await _checkInternetConnection()) {
      if(!_isShow) {
        _showDialogNetwork();
      }
    }
    else if(_isShow) {
      if(_context != null && _context!.mounted) {
        Navigator.pop(_context!);
        _context = null;
        _isShow = false;
      }
      _isShow = false;
    }
  }
}

//=== Kiểm tra khả năng kết nối ===
Future<bool> _checkInternetConnection() async {
  try {
    final response = await http.get(Uri.parse('https://www.google.com'));
    if (response.statusCode == 200) return true;
    return false;
  } catch (e) {
    return false;
  }
}

