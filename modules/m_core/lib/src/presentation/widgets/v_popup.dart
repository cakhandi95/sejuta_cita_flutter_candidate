import 'package:flutter/material.dart';
import 'package:m_core/m_core.dart';

class VPopup {

  VPopup._privateConstructor();

  static final VPopup _instance = VPopup._privateConstructor();

  static BuildContext? _context;

  factory VPopup(BuildContext context) {
    _context = context;
    return _instance;
  }

  AlertDialog _alertDialog({required Widget content, required List<Widget> actions}) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      content: content,
      actions: actions,
    );
  }

  void loading(String message) {
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (c) => LoadingPopup(message: message,),
    );
  }

  void hideLoading() async {
    Navigator.pop(_context!);
  }

  void messageDialog(String title, String message,String text, String img) {
    print("message");print(message);
    showDialog(
      context: _context!,
      builder: (c) => CustomDialogBox(
          title: title,
          descriptions: message,
          text: text,
          img: img
      ),
    );
  }

}