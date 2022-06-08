import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood/pages/profile/profile_page.dart';
import 'package:mood/utils/auth/auth_bloc.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  static const pageName = 'Home';

  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
