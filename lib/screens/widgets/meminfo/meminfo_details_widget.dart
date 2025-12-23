import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/meminfo_bloc/meminfo_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'meminfo_error_view.dart';
import 'meminfo_content_view.dart';
import '../common/loading_indicator.dart';

class MemInfoDetailsWidget extends StatefulWidget {
  final String packageName;

  const MemInfoDetailsWidget({super.key, required this.packageName});

  @override
  State<MemInfoDetailsWidget> createState() => _MemInfoDetailsWidgetState();
}

class _MemInfoDetailsWidgetState extends State<MemInfoDetailsWidget> {
  bool showRawOutput = false;
  MeminfoBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<MeminfoBloc>();
    bloc!.add(MemInfoEvent.fetchMemInfo(packageName: widget.packageName));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeminfoBloc, MemInfoState>(
      bloc: bloc,
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType || prev != curr,
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: LoadingIndicator()),
          loading: (currentData, comparisonData) => const Center(child: LoadingIndicator()),
          error: (message, currentData) => MemInfoErrorView(
            message: message,
            onRetry: () => bloc!.add(MemInfoEvent.fetchMemInfo(packageName: widget.packageName)),
          ),
          loaded: (data, comparisonData) => MemInfoContentView(
            data: data,
            showRawOutput: showRawOutput,
            onToggleRawOutput: () => setState(() => showRawOutput = !showRawOutput),
            onRefresh: () => bloc!.add(MemInfoEvent.fetchMemInfo(packageName: widget.packageName)),
            packageName: widget.packageName,
          ),
        );
      },
    );
  }
}
