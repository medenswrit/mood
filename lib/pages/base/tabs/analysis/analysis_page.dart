import 'package:flutter/material.dart';

class AnalysisPage extends StatefulWidget {
  static const String routeName = '/analysis';
  static const pageName = 'Analysis';

  const AnalysisPage({Key? key}) : super(key: key);

  @override
  AnalysisPageState createState() => AnalysisPageState();
}

class AnalysisPageState extends State<AnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 20.0),
            Text(
              'Analysis Page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
