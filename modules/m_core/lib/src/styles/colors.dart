// colors
import 'package:flutter/material.dart';
import 'package:m_core/m_core.dart';

const Color kYoungPurple = Color(0xFFEDD2F3);
const Color kOxfordBlue = Color(0xFF001D3D);
const Color kPrussianBlue = Color(0xFF003566);
const Color kOceanBlue = Color(0xFF516BEB);
const Color kDavysGrey = Color(0xFF4B5358);
const Color kGrey = Color(0xFF303030);

/// MyBorwita Color : Primary Color
Color colorDefault = HexColor('#F05150');
Color colorDarkBlue = HexColor('#243970');
Color colorBlackPrimary = HexColor('#222222');

/// MyBorwita Color : Secondary Color.
Color colorLightBlue = HexColor('#118DF0');
Color colorYellowSecondary = HexColor('#F8BB22');
Color colorGreenSecondary = HexColor('#2ECC71');

/// MyBorwita Color : Subtitle Color.
Color colorDarkGreySubtitle = HexColor('#B4B4B4');
Color colorGreySubtitle = HexColor('#C7C9D9');

/// MyBorwita Color : Other Color.
Color colorLineStroke = HexColor('#DDE5E9');
Color defaultBgDashboard = HexColor('#F1F4FA');
Color colorCompanyName = HexColor('#C93635');

Color colorGreenChips = HexColor('#EAFAF1');
Color colorBlueChips = HexColor('#E7F4FD');

Color colorGreenChipsLabel = HexColor('#2ECC71');
Color colorBlueChipsLabel = HexColor('#118DF0');
Color colorGreyChips = HexColor('#F7F7F7');
Color colorGreyChipsLabel = HexColor('#909090');

Color colorButtonPressed = Color.fromRGBO(16, 33, 76, 1.0);

const labelPhotoProfile = Color.fromRGBO(179, 61, 65, 1.0); //#B33D41
const labelDescription = Color.fromRGBO(101, 101, 101, 1.0);
const selectedStepProgressBar = Color.fromRGBO(251, 114, 114, 1.0);
const unselectedStepProgressBar = Color.fromRGBO(217, 217, 217, 1.0);
const backgroundPhotoProfile = Color.fromRGBO(230, 184, 186, 1.0); //#E6B8BA
const counterDashboard = Color.fromRGBO(230, 184, 186, 1.0); //#E6B8BA

/// TODO COLOR LIST APPROVAL.
const titleListApproval = Color.fromRGBO(2, 0, 56, 1.0); // #020038
const labelListApproval = Color.fromRGBO(185, 185, 185, 1.0); // #B9B9B9
const buttonApproval = Color.fromRGBO(23, 198, 110, 1.0); // #17C66E
const lineSeparator = Color.fromRGBO(239, 239, 239, 1.0); // #EFEFEF
const backgroundStatusApproval = Color.fromRGBO(247, 247, 247, 1.0); // #EFEFEF

const kColorScheme = ColorScheme(
  primary: kOceanBlue,
  primaryVariant: kOceanBlue,
  secondary: kPrussianBlue,
  secondaryVariant: kPrussianBlue,
  surface: kYoungPurple,
  background: kYoungPurple,
  error: Colors.red,
  onPrimary: kYoungPurple,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);
