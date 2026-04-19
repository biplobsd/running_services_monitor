import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/command_log_commands_ui_bloc/command_log_commands_ui_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';

class CommandLogCommandsHeader extends StatelessWidget {
  const CommandLogCommandsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.loc.usefulCommands, style: AppStyles.titleStyle.copyWith(fontSize: 18)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocSelector<UsefulCommandsBloc, UsefulCommandsState, bool>(
                    bloc: getIt<UsefulCommandsBloc>(),
                    selector: (state) => state.hasHiddenDefaults,
                    builder: (context, hasHiddenDefaults) {
                      if (!hasHiddenDefaults) return const SizedBox.shrink();
                      return IconButton(
                        icon: Icon(Icons.restore, size: 24),
                        tooltip: context.loc.resetDefaults,
                        onPressed: () => getIt<UsefulCommandsBloc>().add(const UsefulCommandsEvent.resetDefaults()),
                      );
                    },
                  ),
                  BlocSelector<CommandLogCommandsUiBloc, CommandLogCommandsUiState, bool>(
                    selector: (state) => state.showAddForm,
                    builder: (context, showAddForm) {
                      return IconButton(
                        icon: Icon(showAddForm ? Icons.close : Icons.add, size: 24),
                        onPressed: () => context.read<CommandLogCommandsUiBloc>().add(const CommandLogCommandsUiEvent.toggleAddForm()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 24),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 1, color: colorScheme.outlineVariant),
      ],
    );
  }
}
