import 'package:flutter/material.dart';

class AppDetailsSectionTitle extends StatelessWidget {
  final String title;

  const AppDetailsSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleMedium);
  }
}
