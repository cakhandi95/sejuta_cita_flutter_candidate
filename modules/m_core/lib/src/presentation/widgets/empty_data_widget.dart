import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 22/06/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class EmptyDataWidget extends StatelessWidget {

  final String title;
  final String message;
  final VoidCallback? onPressed;
  final String titleOnPressed;
  double screenHeight;
  Color? titleColor;
  String? assetName;
  bool isShowButton;

  EmptyDataWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.onPressed,
    required this.titleOnPressed,
    this.screenHeight = 0,
    this.titleColor,
    this.assetName,
    this.isShowButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenLayout = MediaQuery.of(context).size;
    return Container (
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(width: screenLayout.width, height: screenHeight == 0 ? screenLayout.height : screenHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(title, style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: titleColor ?? colorGreenSecondary,
          ),),
          const SizedBox(
            height: 8.5,
          ),
          Padding (
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: colorBlackPrimary,
                  letterSpacing: 0.4
              ),),
          ),
          const SizedBox(
            height: 30,
          ),
          isShowButton ? VButtonTertiary(
            titleOnPressed,
            onPressed: onPressed!,
            width: 150,
            height: 40,
            textStyle: GoogleFonts.poppins(
                fontSize: 12.0,
                color: colorDarkBlue,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal),
            isIcon: false,
            colorAsset: Colors.white,
          ) : Container()
        ],
      ),
    );
  }
}
