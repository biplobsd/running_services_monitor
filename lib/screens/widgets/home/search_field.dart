import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/extensions.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;

  const SearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(hintText: context.loc.searchApps, border: InputBorder.none),
    );
  }
}
