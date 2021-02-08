import 'package:flutter/material.dart';
import 'package:gotrue_dart_example/Screens/Welcome/welcome_screen.dart';
import 'package:gotrue_dart_example/components/alert_modal.dart';
import 'package:gotrue_dart_example/components/link_button.dart';
import 'package:gotrue_dart_example/components/rounded_input_field.dart';
import 'package:gotrue_dart_example/components/rounded_password_field.dart';
import 'package:gotrue_dart_example/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  var email = '';
  var password = '';

  void _onSignInPress(BuildContext context) async {
    final response =
        await gotrueClient.signIn(email: email, password: password);
    if (response.error != null) {
      alertModal.show(context,
          title: 'Sign in failed', message: response.error.message);
      _btnController.reset();
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(PERSIST_SESSION_KEY, response.data.persistSessionString);

      final title = 'Welcome ${response.data.user.email}';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WelcomeScreen(title);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 25.0),
            RoundedInputField(
              hintText: "Email address",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 25.0),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(
              height: 35.0,
            ),
            RoundedLoadingButton(
              child: Text('Sign in',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              controller: _btnController,
              onPressed: () {
                _onSignInPress(context);
              },
            ),
            SizedBox(
              height: 35.0,
            ),
            LinkButton(
                text: "Forgot your password ?",
                press: () {
                  Navigator.of(context)
                      .pushReplacementNamed(PASSWORDRECOVER_SCREEN);
                }),
            SizedBox(
              height: 35.0,
            ),
            LinkButton(
                text: "Don’t have an Account ? Sign up",
                press: () {
                  Navigator.of(context).pushReplacementNamed(SIGNUP_SCREEN);
                }),
          ],
        ),
      ),
    );
  }
}
