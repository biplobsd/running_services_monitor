import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo.png', width: 32, height: 32, color: Theme.of(context).colorScheme.onSurface);
  }
}
