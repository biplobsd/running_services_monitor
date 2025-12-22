import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/meminfo_bloc/meminfo_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'widgets/common/loading_indicator.dart';
import 'widgets/meminfo/meminfo_compare_content.dart';
import 'widgets/meminfo/meminfo_app_select_sheet.dart';

class MemInfoCompareScreen extends StatefulWidget {
  final String? packageName;

  const MemInfoCompareScreen({super.key, this.packageName});

  @override
  State<MemInfoCompareScreen> createState() => _MemInfoCompareScreenState();
}

class _MemInfoCompareScreenState extends State<MemInfoCompareScreen> {
  MeminfoBloc? bloc;

  @override
  void initState() {
    super.initState();
    bloc = getIt<MeminfoBloc>();
    if (widget.packageName != null) {
      bloc!.add(MemInfoEvent.fetchMemInfo(packageName: widget.packageName!));
    }
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
            initial: () => widget.packageName == null ? _buildAppSelector(context) : Center(child: LoadingIndicator()),
            loading: (currentData, _) => currentData != null
                ? MemInfoCompareContent(
                    bloc: bloc!,
                    currentData: currentData,
                    comparisonData: null,
                    isLoadingComparison: true,
                    packageName: widget.packageName ?? currentData.packageName,
                  )
                : Center(child: LoadingIndicator()),
            error: (message, _) => Center(child: Text(message)),
            loaded: (data, comparisonData) => MemInfoCompareContent(
              bloc: bloc!,
              currentData: data,
              comparisonData: comparisonData,
              isLoadingComparison: false,
              packageName: widget.packageName ?? data.packageName,
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppSelector(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
      bloc: getIt<HomeBloc>(),
      selector: (state) => state.value.allApps,
      builder: (context, allApps) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.compare_arrows_rounded, size: 64.sp, color: Theme.of(context).colorScheme.primary),
              SizedBox(height: 16.h),
              Text(
                context.loc.selectAppToCompare,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24.h),
              FilledButton.icon(
                onPressed: () {
                  MemInfoAppSelectSheet.show(context, allApps, (selectedPackage) {
                    // Update state to reflect the selected package if needed, or just let BLoC drive it
                    // But since packageName is final in widget, we rely on rebuilding with new data from BLoC,
                    // OR we push a replacement route?
                    // Simpler: Just fetch data, and the BlocBuilder will see the "loaded" state and render content.
                    bloc!.add(MemInfoEvent.fetchMemInfo(packageName: selectedPackage));
                  });
                },
                icon: const Icon(Icons.touch_app),
                label: Text(context.loc.selectApp),
              ),
            ],
          ),
        );
      },
    );
  }
}
