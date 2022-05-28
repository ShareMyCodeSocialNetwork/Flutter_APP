import 'dart:convert';

class UserRequest {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? pseudo;
  String? profilePicture;

  String toJson(){
    return jsonEncode(<String,String?>{
      'firstname':this.firstname,
      'lastname':this.lastname,
      'password':this.password,
      'pseudo':this.pseudo,
      'email':this.email,
      'profilePicture':this.profilePicture
    });
  }
}
