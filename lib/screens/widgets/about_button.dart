import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/core/extensions.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () => context.push('/about'),
      tooltip: context.loc.about,
    );
  }
}
