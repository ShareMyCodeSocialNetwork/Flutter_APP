import 'package:flutter_app/web/use_case/user/entities/user_response.dart';
import 'package:flutter/material.dart';

final String url = 'http://localhost:8080/';
String token = '';
bool isConnected = false;
String buildUrl(String endUrl) {
  return url + endUrl;
}

UserResponse connectedUser = new UserResponse();

String access_token = '';
String refresh_token = '';

Color buttonColor = Color.fromRGBO(36, 140, 69, 1);