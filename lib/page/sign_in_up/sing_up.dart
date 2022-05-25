import 'package:flutter/material.dart';
import 'package:flutter_app/page/sign_in_up/sign_in.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S\'enregistrer'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, //boutton retour sur lappbar
      ),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [form(), bottomSign_up()],
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
        }else{
          //todo voir si on peut faire requete pour check si le pseudo est pas deja pris
        }
        return null;
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
                  }else if(value.length < 8 && value.length > 30){ //todo a regarder flem de reflechir il est tard ˆˆ'
                    return 'Le mot de passe doit contenir entre 8 et 30 caractères';
                  }
                  return null;
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
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Enregistrement en cours...')),
              );
              //requete de creation user
              //if requete ok
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Sign_in();
              }));
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
