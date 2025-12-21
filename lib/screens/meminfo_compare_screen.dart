import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/meminfo_bloc/meminfo_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'widgets/common/loading_indicator.dart';
import 'widgets/meminfo/meminfo_compare_content.dart';

class MemInfoCompareScreen extends StatefulWidget {
  final String packageName;

  const MemInfoCompareScreen({super.key, required this.packageName});

  @override
  State<MemInfoCompareScreen> createState() => _MemInfoCompareScreenState();
}

class _MemInfoCompareScreenState extends State<MemInfoCompareScreen> {
  MeminfoBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<MeminfoBloc>();
    bloc!.add(MemInfoEvent.fetchMemInfo(packageName: widget.packageName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.memoryComparison, style: TextStyle(fontSize: 20.sp)),
      ),
      body: BlocBuilder<MeminfoBloc, MemInfoState>(
        bloc: bloc,
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: LoadingIndicator()),
            loading: (currentData, _) => currentData != null
                ? MemInfoCompareContent(
                    bloc: bloc!,
                    currentData: currentData,
                    comparisonData: null,
                    isLoadingComparison: true,
                    packageName: widget.packageName,
                  )
                : Center(child: LoadingIndicator()),
            error: (message, _) => Center(child: Text(message)),
            loaded: (data, comparisonData) => MemInfoCompareContent(
              bloc: bloc!,
              currentData: data,
              comparisonData: comparisonData,
              isLoadingComparison: false,
              packageName: widget.packageName,
            ),
          );
        },
      ),
    );
  }
}
