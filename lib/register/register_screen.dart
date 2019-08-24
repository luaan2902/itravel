import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itravel/user_repository.dart';

import '../utils.dart';
import 'bloc/bloc.dart';
import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF696D77), Color(0xFF292C36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
            title: Text('Register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(18.0, context),
                    fontFamily: "Montserrat-Bold"))),
        body: Center(
          child: BlocProvider<RegisterBloc>(
            builder: (context) => RegisterBloc(userRepository: _userRepository),
            child: RegisterForm(),
          ),
        ),
      ),
    );
  }
}
