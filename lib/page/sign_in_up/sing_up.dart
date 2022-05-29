import 'package:flutter/material.dart';
import 'package:flutter_app/page/sign_in_up/sign_in.dart';
import 'package:flutter_app/web/use_case/user/entities/user_request.dart';
import 'package:flutter_app/web/use_case/user/query/user_query.dart';

import '../../web/use_case/user/command/user_command.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final _formKey = GlobalKey<FormState>();
  var userCommand = new UserCommand();
  var userQuery = new UserQuery();
  var userRequest = new UserRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('S\'enregistrer'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, //boutton retour sur lappbar
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: form(),
            ),
            bottomSign_up(),
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
          textBoxStyle(pseudoTextBox()),
          textBoxStyle(lastnameTextBox()),
          textBoxStyle(firstnameTextBox()),
          textBoxStyle(emailTextBox()),
          passwordTextBox(),
          connectionButton(),
        ],
      ),
    );
  }

  TextFormField pseudoTextBox() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez remplir ce champs';
        } else {
          //todo a voir, le async il aime pas
          /*if (await userQuery.pseudoExist(value) == true) {
            return 'Pseudo déjà pris !';
        }*/
        }
        return null;
      },
      onSaved: (String? value) {
        userRequest.pseudo = value;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Pseudo',
      ),
    );
  }

  TextFormField lastnameTextBox() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez remplir ce champs';
        }
        return null;
      },
      onSaved: (String? value) {
        userRequest.lastname = value;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Nom',
      ),
    );
  }

  TextFormField firstnameTextBox() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez remplir ce champs';
        }
        return null;
      },
      onSaved: (String? value) {
        userRequest.firstname = value;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Prénom',
      ),
    );
  }

  TextFormField emailTextBox() {
    return TextFormField(
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
        userRequest.email = value;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Email',
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
              color: Colors.grey,
              borderRadius: new BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez remplir ce champs';
                  } else if (value.length < 8 && value.length > 30) {
                    //todo a regarder flem de reflechir il est tard ˆˆ'
                    return 'Le mot de passe doit contenir entre 8 et 30 caractères';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  userRequest.password = value;
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
              _formKey.currentState?.save();
              if (await userQuery.pseudoExist(userRequest.pseudo.toString()) ==
                  true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pseudo déjà pris !')),
                );
              } else {
                var response = await userCommand.createUser(userRequest);
                if (await userQuery.userExist(response.id) == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enregistrement en cours...')),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Sign_in();
                    }),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Erreur lors de la création du compte...')),
                  );
                }
              }
            }
          },
          child: Text(
            'S\'enregistrer',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.black, primary: Colors.blue),
        ),
      ),
    );
  }

  Align bottomSign_up() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Sign_in();
          }));
        },
        child: Text('Déjà un compte ? connecte toi !'),
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

  Padding textBoxStyle(TextFormField textFormField) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: textFormField),
      ),
    );
  }
}
