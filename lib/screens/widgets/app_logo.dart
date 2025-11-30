import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo.png', width: 32.w, height: 32.h, color: Theme.of(context).colorScheme.onSurface);
  }
}
