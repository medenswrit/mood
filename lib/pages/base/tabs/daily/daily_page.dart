import 'package:flutter/material.dart';

class DailyPage extends StatefulWidget {
  static const String routeName = '/daily';
  static const pageName = 'Daily';

  const DailyPage({Key? key}) : super(key: key);

  @override
  DailyPageState createState() => DailyPageState();
}

class DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 20.0),
            Text(
              'Daily Page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
