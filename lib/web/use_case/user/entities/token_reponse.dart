import 'package:jwt_decoder/jwt_decoder.dart';

class TokenResponse {
  String? access_token;
  String? refresh_token;

  Map<String, dynamic> decode(){
    return JwtDecoder.decode(access_token!);
  }

  String emailFromToken(){
    var response = decode();
    if(response.containsKey("sub")){
      return response["sub"];
    }
    return '';
  }
}


/* decode jwt return
{
  "sub": "ljehanno@myges.fr",
  "roles": [
    "name"
  ],
  "iss": "http://localhost:8080/login",
  "exp": 1653917402
}
 */