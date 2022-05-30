import 'package:flutter/material.dart';
import 'package:flutter_app/web/use_case/user/entities/user_response.dart';
import 'package:flutter_app/web/use_case/user/query/user_query.dart' as userQuery;
import '../../web/global.dart' as global;
class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('post de tout les utilisateurs que tu suis')
    );
  }
}