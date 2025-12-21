import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/meminfo_bloc/meminfo_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/loading_indicator.dart';
import 'meminfo_app_select_sheet.dart';
import 'meminfo_app_card.dart';
import 'meminfo_comparison_view.dart';
import '../common/code_output_box.dart';

class MemInfoCompareContent extends StatefulWidget {
  final MeminfoBloc bloc;
  final MemInfoData currentData;
  final MemInfoData? comparisonData;
  final bool isLoadingComparison;
  final String packageName;

  const MemInfoCompareContent({
    super.key,
    required this.bloc,
    required this.currentData,
    required this.comparisonData,
    required this.isLoadingComparison,
    required this.packageName,
  });

  @override
  State<MemInfoCompareContent> createState() => _MemInfoCompareContentState();
}

class _MemInfoCompareContentState extends State<MemInfoCompareContent> {
  bool showRawOutput = false;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, (List<AppProcessInfo>, AppProcessInfo?, AppProcessInfo?)>(
      bloc: getIt<HomeBloc>(),
      selector: (state) {
        final allApps = state.value.allApps;
        final currentApp = allApps.firstWhereOrNull((a) => a.packageName == widget.packageName);
        final selectedApp = widget.comparisonData != null
            ? allApps.firstWhereOrNull((a) => a.packageName == widget.comparisonData!.packageName)
            : null;
        return (allApps, currentApp, selectedApp);
      },
      builder: (context, data) {
        final (allApps, currentApp, selectedApp) = data;
        final otherAppsForCurrent = allApps
            .where((app) => app.packageName != (widget.comparisonData?.packageName ?? ''))
            .toList();
        final otherAppsForCompare = allApps.where((app) => app.packageName != widget.packageName).toList();

        void showCurrentAppSelector() {
          MemInfoAppSelectSheet.show(context, otherAppsForCurrent, (packageName) {
            widget.bloc.add(MemInfoEvent.fetchMemInfo(packageName: packageName));
          });
        }

        void showCompareAppSelector() {
          MemInfoAppSelectSheet.show(context, otherAppsForCompare, (packageName) {
            widget.bloc.add(MemInfoEvent.fetchForComparison(packageName: packageName));
          });
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: showCurrentAppSelector,
                          child: MemInfoAppCard(appInfo: currentApp),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(Icons.compare_arrows, color: Theme.of(context).colorScheme.primary),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: showCompareAppSelector,
                          child: MemInfoAppCard(appInfo: selectedApp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  FilledButton.tonalIcon(
                    onPressed: () => setState(() => showRawOutput = !showRawOutput),
                    icon: Icon(showRawOutput ? Icons.visibility_off : Icons.code, size: 18.sp),
                    label: Text(
                      showRawOutput ? context.loc.hideRawOutput : context.loc.viewRawOutput,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                  if (showRawOutput) ...[
                    SizedBox(height: 12.h),
                    Text(
                      '${context.loc.current}:',
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    CodeOutputBox(
                      text: widget.currentData.rawOutput.isEmpty ? context.loc.noOutput : widget.currentData.rawOutput,
                      fontSize: 9.sp,
                      textColor: const Color(0xFF4EC9B0),
                      backgroundColor: Colors.black,
                      horizontalScroll: true,
                      hasBorder: true,
                    ),
                    if (widget.comparisonData != null) ...[
                      SizedBox(height: 12.h),
                      Text(
                        '${context.loc.compareWith}:',
                        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8.h),
                      CodeOutputBox(
                        text: widget.comparisonData!.rawOutput.isEmpty
                            ? context.loc.noOutput
                            : widget.comparisonData!.rawOutput,
                        fontSize: 9.sp,
                        textColor: const Color(0xFF4EC9B0),
                        backgroundColor: Colors.black,
                        horizontalScroll: true,
                        hasBorder: true,
                      ),
                    ],
                  ],
                  SizedBox(height: 24.h),
                  if (widget.isLoadingComparison)
                    Center(child: LoadingIndicator())
                  else if (widget.comparisonData != null)
                    MemInfoComparisonView(
                      currentData: widget.currentData,
                      comparisonData: widget.comparisonData!,
                      otherApps: otherAppsForCompare,
                      packageName: widget.packageName,
                      onCurrentAppTap: showCurrentAppSelector,
                      onCompareAppTap: showCompareAppSelector,
                    ),
                ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
