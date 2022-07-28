import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m_core/m_core.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Future<SecurityContext> get globalContext async {
  final sslCert = await rootBundle.load('certificates/certificates.pem');
  SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
  securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  return securityContext;
}

///enum TypeCinema { Movie, TvSeries }

String decodeApiKeyHeader(String value) {
  List<int> res = base64.decode(base64.normalize(value));
  return utf8.decode(res);
}

String basicAuthenticationHeader(String? username, String? password) {
  return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
}

void toast(String title,{Toast? toastLength}) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: toastLength ?? Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.black.withOpacity(0.75),
      textColor: Colors.white,
      fontSize: 14.0);
}