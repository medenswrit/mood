import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Widget child;

  const BaseCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: child,
      ),
    );
  }
}
