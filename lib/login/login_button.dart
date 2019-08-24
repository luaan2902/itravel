import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      onPressed: _onPressed,
      color: Colors.lightBlue,
      child: Text('Login', style: TextStyle(color: Colors.white),),
    );
  }
}