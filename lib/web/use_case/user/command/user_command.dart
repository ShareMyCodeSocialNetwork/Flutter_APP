import 'dart:convert';

import '../../../global.dart' as global;
import 'dart:async';
import 'package:flutter_app/web/use_case/user/entities/user_request.dart';
import 'package:http/http.dart' as http;
import '../entities/user_request.dart';
import '../entities/user_response.dart';

Future<bool> login(UserRequest userRequest) async {
  final response = await http.post(Uri.parse(global.buildUrl('user/login')),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: userRequest.toJson());

  global.connectedUser = UserResponse.fromJson(json.decode(response.body));
  return response.statusCode == 200 ? true : false;
}

Future<UserResponse> createUser(UserRequest userRequest) async {
  final response = await http.post(Uri.parse(global.buildUrl('user/create')),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: userRequest.toJson());

  if (response.statusCode == 201) {
    return UserResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user');
  }
}
