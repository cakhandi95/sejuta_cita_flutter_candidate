// text style
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:m_core/m_core.dart';

// text style  : HEADING 1 - 3
final TextStyle kHeading1 = GoogleFonts.poppins(
    fontSize: 20, letterSpacing: 0, fontWeight: FontWeight.w500);

final TextStyle kHeading2 = GoogleFonts.poppins(
    fontSize: 16, letterSpacing: 0.15, fontWeight: FontWeight.w500);

final TextStyle kHeading3 = GoogleFonts.poppins(
    fontSize: 14, letterSpacing: 0.1, fontWeight: FontWeight.w500);

// text style : Body Small s/d Body Large.
final TextStyle kBodySmall = GoogleFonts.poppins(
    fontSize: 12, letterSpacing: 0.1, fontWeight: FontWeight.w500);

final TextStyle kBodyMedium = GoogleFonts.poppins(
    fontSize: 14, letterSpacing: 0.25, fontWeight: FontWeight.w400);

final TextStyle kBodyLarge = GoogleFonts.poppins(
    fontSize: 16, letterSpacing: 0.15, fontWeight: FontWeight.w400);

// text style : Label small s/d Label large.
final TextStyle kLabelSmall = GoogleFonts.poppins(
    fontSize: 10, letterSpacing: 0.1, fontWeight: FontWeight.w500);

final TextStyle kLabelMedium = GoogleFonts.poppins(
    fontSize: 12, letterSpacing: 0.5, fontWeight: FontWeight.w500);

final TextStyle kLabelLarge = GoogleFonts.poppins(
    fontSize: 14, letterSpacing: 0.1, fontWeight: FontWeight.w500);

final txtWhiteBoldStyle = GoogleFonts.roboto(
    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0);

final txtLoginLabel = GoogleFonts.poppins(
    color: colorBlackPrimary,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25);

final txtEmailLabel = GoogleFonts.poppins(
    color: colorBlackPrimary,
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25);

final txtDescLogin = GoogleFonts.poppins(
    color: colorDarkGreySubtitle,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4);

// text theme
final kTextTheme = TextTheme(
    headline1: kHeading1,
    headline2: kHeading2,
    headline3: kHeading3,
    bodySmall: kBodySmall,
    bodyMedium: kBodyMedium,
    bodyLarge: kBodyLarge,
    labelSmall: kLabelSmall,
    labelMedium: kLabelMedium,
    labelLarge: kLabelLarge);

