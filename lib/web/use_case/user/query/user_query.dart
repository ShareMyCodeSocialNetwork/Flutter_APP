import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../global.dart';
import '../entities/user_response.dart';

class UserQuery {
  var global = new Global();

  Future<UserResponse> getById(int id) async {
    final response = await http.get(Uri.parse(global.buildUrl('user/' + id.toString())));
    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<bool> pseudoExist(String pseudo) async {
    final response = await http.get(Uri.parse(global.buildUrl('user/pseudo/' + pseudo)));
    return response.statusCode == 200 ? true : false;
  }

  Future<bool> userExist(int id) async {
    final response = await http.get(Uri.parse(global.buildUrl('user/' + id.toString())));
    return response.statusCode == 200 ? true : false;
  }

}
