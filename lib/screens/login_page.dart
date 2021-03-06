import 'package:capacitacionflutter2/blocs/login_controller.dart';
import 'package:capacitacionflutter2/screens/home_page.dart';
import 'package:capacitacionflutter2/screens/sing_up_page.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _loginController = LoginController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _show = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _username.dispose();
    _password.dispose();
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Buillllllllllllllllld");
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                  child: FlareActor("assets/rive/Resizing House.flr",

                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      animation: "Demo Mode")),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100,),
                    TextFormField(
                      controller: _username,
                    ),
                    StreamBuilder<bool>(
                        initialData: _loginController.show,
                        stream: _loginController.getShow,
                        builder: (context, snapshot) {
                          return TextFormField(
                            controller: _password,
                            obscureText: !snapshot.data,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                              icon: Icon(snapshot.data
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                _loginController.setShow();
                              },
                            )),
                          );
                        }),
                    ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: Text("Login")),
                    SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SingUpPage()));
                        },
                        child: Text("Crear una cuenta"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Error",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(message)
                ],
              ),
            ),
          );
        });
  }

  void _login() async {
    try {
      await _loginController.login(_username.text, _password.text);
      print("Login");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      showError(e["message"]);
      print(e);
    }
  }
}
