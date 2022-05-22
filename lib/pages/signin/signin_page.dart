import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood/common/dialog/error_dialog.dart';
import 'package:mood/pages/signin/cubit/signin_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  void _submit() {
    context.read<SigninCubit>().logInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state.signinStatus == SigninStatus.error) {
              errorDialog(context, state.error);
            }
          },
          builder: (context, state) {
            return Align(
              alignment: const Alignment(0, -1 / 3),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 120),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      key: const Key('loginForm_googleLogin_raisedButton'),
                      label: const Text(
                        'SIGN IN WITH GOOGLE',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        primary: Colors.blue,
                      ),
                      icon: const Icon(FontAwesomeIcons.google,
                          color: Colors.white),
                      onPressed: () => _submit(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
