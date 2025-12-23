import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class AboutInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const AboutInfoTile({super.key, required this.icon, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: AppStyles.bodyStyle),
      subtitle: Text(subtitle, style: AppStyles.captionStyle),
      onTap: onTap,
      trailing: onTap != null ? Icon(Icons.open_in_new, size: 16.w) : null,
    );
  }
}
