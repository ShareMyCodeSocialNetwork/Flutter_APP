import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../global.dart';
import '../entities/user_response.dart';

var global = new Global();

Future<UserResponse> getAll() async{
  final response = await http
      .get(Uri.parse(global.url + 'user/'));
  if(response.statusCode == 200){
    return UserResponse.fromJson(jsonDecode(response.body));
  }else{
    throw Exception('Failed to load users');
  }
}