import 'package:flutter/material.dart';
import 'package:flutter_app/page/sign_in_up/sing_up.dart';
import 'package:flutter_app/web/use_case/user/command/user_command.dart' as userCommand;
import 'package:flutter_app/web/use_case/user/entities/user_request.dart';
import '../home.dart';
import '../../web/global.dart' as global;

//connection page
class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Se Connecter'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, //boutton retour sur lappbar
      ),
      body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              form(),
              bottomSign_in(),
            ],
          ),
        ),
    );
  }

  Form form() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          emailTextBox(),
          passwordTextBox(),
          connectionButton(),
        ],
      ),
    );
  }

  Padding emailTextBox() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez remplir ce champs';
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Email invalide';
              }
              return null;
            },
            onSaved: (String? value) {
              _email = value;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Email',
            ),
          ),
        ),
      ),
    );
  }

  Padding passwordTextBox() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        alignment: const Alignment(0, 0),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  _password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Mot de passe',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding connectionButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connexion en cours...')),
              );
              _formKey.currentState?.save();
              var userRequest = new UserRequest();
              userRequest.email = _email;
              userRequest.password = _password;

              if (await userCommand.login(userRequest) == true) {
                global.isConnected = true;
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Home();
                }));
              } else {
                invalidEmailOrPassword();
              }
            }
          },
          child: Text(
            'Connexion',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
               primary: global.buttonColor, ),
        ),
      ),
    );
  }

  Align bottomSign_in() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Sign_up();
          }));
        },
        child: Text('Pas de compte ? créer en un !'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              return Colors.black;
            },
          ),
        ),
      ),
    );
  }

  Future<void> invalidEmailOrPassword() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(''),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Mauvais mot de passe ou email.'),
                Text('Veuillez réessayer'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
