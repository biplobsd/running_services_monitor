import 'package:flutter/material.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'dismissible_service_item.dart';

class ServiceList extends StatelessWidget {
  final List<RunningServiceInfo> services;

  const ServiceList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return DismissibleServiceItem(service: services[index]);
          }, childCount: services.length),
        ),
      ],
    );
  }
}
