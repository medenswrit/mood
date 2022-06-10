import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood/pages/base/base_page.dart';
import 'package:mood/pages/profile/profile_page.dart';
import 'package:mood/utils/auth/auth_bloc.dart';

class TestPage extends StatefulWidget {
  static const String routeName = '/test';
  static const pageName = 'Test';

  const TestPage({Key? key}) : super(key: key);

  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(BasePage.routeName);
              },
              icon: const Icon(Icons.account_box),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
              icon: const Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignoutRequestedEvent());
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 20.0),
              Text(
                'Bloc is an awesome\nstate management library\nfor flutter!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
