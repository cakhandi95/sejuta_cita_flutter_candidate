import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///
/// Created by Handy on 10/11/2020
/// HP G1 430
/// Email : it.handy@borwita.co.id
///

class Tools {

  late Size screenLayout;

  static String getCapitalizeString(String str) {
    return str.toUpperCase();
  }

  Future<Size> _getImageSize(Image image) {
    Completer<Size> completer = Completer<Size>();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool synchronousCall) {
      completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble()
      ));
    }));
    return completer.future;
  }


  double childAspectRatio(Size size) {
    double itemHeight;
    double itemWidth;
    itemWidth = size.width / 2;
    if(Platform.isAndroid) {
      itemHeight = (size.height - kToolbarHeight - 80) / 4.5;
    } else {
      itemHeight = (size.height - kToolbarHeight - 60) / 2;
    }
    return itemWidth / itemHeight;
  }

  int sizeResponsiveWidget(Size size) {
    return 0;
  }

  static String getDateNow(String formatDate) {
    final dateTime = DateTime.now();
    final format = DateFormat(formatDate);
    final clockString = format.format(dateTime);
    return clockString;
  }

  static String getDateParse(String parse, String formatDate) {
    final dateTime = DateTime.parse(parse);

    final format = DateFormat(formatDate,"id");
    final clockString = format.format(dateTime);
    return clockString;
  }

  static int getSecondInMinutes(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day,from.hour,from.minute,from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return (to.difference(from).inSeconds).round();
  }

  static int getMinutesInDay(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day,from.hour,from.minute,from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return (to.difference(from).inSeconds).round();
  }

  static int getHourInWeek(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day,from.hour,from.minute,from.second);
    to = DateTime(to.year, to.month, to.day, to.hour, to.minute, to.second);
    return (to.difference(from).inHours).round();
  }

  static int getDayInMonth(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static Future<int> getMonthInYear(DateTime from, DateTime to) async {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static String getCurrencyNumber(String number) {
    var roundNumber = double.parse(number).round();
    var a = NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(roundNumber);
    return a;
  }

  static DateTime minDateTime(DateTime x, DateTime y) {
    return (x.microsecond < y.microsecond) ? x : y;
  }

  static DateTime maxDateTime(DateTime x, DateTime y) {
    return (x.microsecond > y.microsecond) ? x : y;
  }

}