import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/working_mode_bloc/working_mode_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/working_mode.dart';
import 'package:running_services_monitor/models/working_mode_state_model.dart';

class WorkingModeSelector extends StatelessWidget {
  const WorkingModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocSelector<WorkingModeBloc, WorkingModeState, WorkingModeStateModel>(
        bloc: getIt<WorkingModeBloc>(),
        selector: (state) => state.value,
        builder: (context, model) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.spacingH10,
              Padding(
                padding: AppStyles.paddingH16V8,
                child: Text(context.loc.selectWorkingMode, style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold)),
              ),
              _buildModeOption(context, mode: WorkingMode.root, isAvailable: model.isRootAvailable, isSelected: model.currentMode == WorkingMode.root),
              _buildModeOption(context, mode: WorkingMode.shizuku, isAvailable: model.isShizukuAvailable, isSelected: model.currentMode == WorkingMode.shizuku),
              AppStyles.spacingH16,
            ],
          );
        },
      ),
    );
  }

  Widget _buildModeOption(BuildContext context, {required WorkingMode mode, required bool isAvailable, required bool isSelected}) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(_getModeDisplayName(context, mode), style: AppStyles.bodyStyle),
      subtitle: Text(
        isAvailable ? context.loc.available : context.loc.notAvailable,
        style: AppStyles.subtitleStyle.copyWith(color: isAvailable ? Colors.green : Colors.grey),
      ),
      leading: Icon(isSelected ? Icons.check_circle : Icons.check_circle_outline, color: colorScheme.primary),
      enabled: isAvailable,
      onTap: isAvailable
          ? () {
              getIt<WorkingModeBloc>().add(WorkingModeEvent.setMode(mode));
            }
          : null,
    );
  }

  String _getModeDisplayName(BuildContext context, WorkingMode mode) {
    return switch (mode) {
      WorkingMode.root => context.loc.rootMode,
      WorkingMode.shizuku => context.loc.shizukuMode,
    };
  }
}
