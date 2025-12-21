import 'package:flutter/material.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'process_list_item.dart';

class ProcessList extends StatelessWidget {
  final List<ProcessEntry> processes;
  final String packageName;

  const ProcessList({super.key, required this.processes, required this.packageName});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProcessListItem(process: processes[index], packageName: packageName);
      }, childCount: processes.length),
    );
  }
}
