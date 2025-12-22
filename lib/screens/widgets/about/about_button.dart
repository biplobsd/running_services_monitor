import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/working_mode_bloc/working_mode_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/working_mode.dart';
import '../settings/working_mode_selector.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WorkingModeBloc, WorkingModeState, WorkingMode?>(
      bloc: getIt<WorkingModeBloc>(),
      selector: (state) => state.value.currentMode,
      builder: (context, currentMode) {
        return BlocSelector<HomeBloc, HomeState, bool>(
          bloc: getIt<HomeBloc>(),
          selector: (state) => state.value.showCoreApps,
          builder: (context, showCoreApps) {
            return PopupMenuButton<String>(
              icon: const Icon(Icons.info_outline),
              tooltip: context.loc.about,
              onSelected: (value) {
                if (value == 'about') {
                  context.push('/about');
                } else if (value == 'mode') {
                  showModalBottomSheet(context: context, builder: (context) => const WorkingModeSelector());
                } else if (value == 'logs') {
                  context.push('/command-logs');
                } else if (value == 'compare') {
                  context.push('/meminfo-compare');
                } else if (value == 'showCore') {
                  getIt<HomeBloc>().add(const HomeEvent.toggleShowCoreApps());
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'mode',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.settings, size: 20.sp),
                    title: Text(context.loc.workingMode, style: TextStyle(fontSize: 14.sp)),
                    subtitle: currentMode != null ? Text(_getModeDisplayName(context, currentMode), style: TextStyle(fontSize: 12.sp)) : null,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'showCore',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    // Ignore pointer events on the switch so the menu item handles the tap
                    leading: IgnorePointer(
                      child: Transform.scale(
                        scale: 0.50,
                        child: SizedBox(
                          width: 15.sp,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.sp),
                            child: Switch(value: showCoreApps, onChanged: (_) {}, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          ),
                        ),
                      ),
                    ),
                    title: Text(context.loc.showCoreApps, style: TextStyle(fontSize: 14.sp)),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'logs',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.terminal, size: 20.sp),
                    title: Text(context.loc.commandLogs, style: TextStyle(fontSize: 14.sp)),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'compare',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.compare_arrows, size: 20.sp),
                    title: Text(context.loc.compareWithOther, style: TextStyle(fontSize: 14.sp)),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'about',
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.info_outline, size: 20.sp),
                    title: Text(context.loc.about, style: TextStyle(fontSize: 14.sp)),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _getModeDisplayName(BuildContext context, WorkingMode mode) {
    return switch (mode) {
      WorkingMode.root => context.loc.rootMode,
      WorkingMode.shizuku => context.loc.shizukuMode,
    };
  }
}
