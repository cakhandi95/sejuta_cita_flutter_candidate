import 'package:flutter/material.dart';

class LoadingPopup extends StatefulWidget {

  final String message;

  const LoadingPopup({Key? key, required this.message}) : super(key: key);

  @override
  _LoadingPopupState createState() => _LoadingPopupState();
}

class _LoadingPopupState extends State<LoadingPopup> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 16.0,
              ),
              Text(widget.message),
            ],
          ),
        ),
      ),
    );
  }
}
