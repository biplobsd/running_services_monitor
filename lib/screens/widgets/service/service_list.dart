import 'package:flutter/material.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'service_list_item.dart';

class ServiceList extends StatelessWidget {
  final List<RunningServiceInfo> services;

  const ServiceList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ServiceListItem(service: services[index]);
      }, childCount: services.length),
    );
  }
}
