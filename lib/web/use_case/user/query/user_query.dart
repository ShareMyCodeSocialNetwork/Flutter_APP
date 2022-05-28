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


}
