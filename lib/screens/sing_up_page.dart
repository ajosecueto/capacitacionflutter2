import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SingUpPage extends StatefulWidget {
  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Text("Logearse con facebook"),
            onPressed: () async {
              final facebookLogin = FacebookLogin();
              final result = await facebookLogin.logIn(['email']);

              switch (result.status) {
                case FacebookLoginStatus.loggedIn:
                  print(result.accessToken.token);
                  break;
                case FacebookLoginStatus.cancelledByUser:
                  print("usuario cancelo");
                  break;
                case FacebookLoginStatus.error:
                  print(result.errorMessage);
                  break;
              }
            },
          ),
          TextButton(
            child: Text("Logearse con google"),
            onPressed: () async {
              GoogleSignIn _googleSignIn = GoogleSignIn(
                scopes: ['email'],
              );
              try {
                final google = await _googleSignIn.signIn();
                final token = await google.authentication;
                print(token.accessToken);
              } catch (error) {
                print("and error");
                print(error);
                print(_googleSignIn.clientId);
              }
            },
          ),
        ],
      ),
    ));
  }
}
