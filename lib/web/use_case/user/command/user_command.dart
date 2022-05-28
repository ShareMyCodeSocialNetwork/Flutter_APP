import 'package:flutter_app/web/global.dart';
import 'dart:async';
import 'package:flutter_app/web/use_case/user/entities/user_request.dart';
import 'package:http/http.dart' as http;
import '../entities/user_request.dart';

class UserCommand{
  var global = new Global();

  Future<bool> login(UserRequest userRequest) async{
    final response = await http.post(
        Uri.parse(global.buildUrl('user/login')),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userRequest.toJson()
    );
    return response.statusCode == 200 ? true : false;
  }
}
/*
mois@dMYGE.FR
MotDePasse
 */