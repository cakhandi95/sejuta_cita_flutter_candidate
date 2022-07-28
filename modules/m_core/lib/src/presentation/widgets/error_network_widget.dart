import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 22/06/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class ErrorNetworkWidget extends StatelessWidget {

  final String title;
  final String message;
  final VoidCallback? onPressed;
  final String titleOnPressed;

  const ErrorNetworkWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.onPressed,
    required this.titleOnPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenLayout = MediaQuery.of(context).size;
    return Container (
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(width: screenLayout.width, height: screenLayout.height),
      child: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: colorDefault,
          )),
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
          VButtonTertiary(
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
          )
        ],
      ),
    );
  }
}
