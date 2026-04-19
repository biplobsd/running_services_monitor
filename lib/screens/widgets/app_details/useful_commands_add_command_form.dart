import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_ui_bloc/useful_commands_ui_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'useful_commands_placeholder_reference.dart';

class UsefulCommandsAddCommandForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController commandController;
  final String packageName;
  final AppProcessInfo? appInfo;

  const UsefulCommandsAddCommandForm({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.commandController,
    required this.packageName,
    this.appInfo,
  });

  void _addCustomCommand(BuildContext context) {
    if (titleController.text.isEmpty || commandController.text.isEmpty) return;
    getIt<UsefulCommandsBloc>().add(
      UsefulCommandsEvent.addCommand(
        title: titleController.text,
        description: descriptionController.text,
        command: commandController.text,
      ),
    );
    titleController.clear();
    descriptionController.clear();
    commandController.clear();
    context.read<UsefulCommandsUiBloc>().add(const UsefulCommandsUiEvent.hideAddForm());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.addCommand, style: AppStyles.titleStyle.copyWith(fontSize: 14)),
          const SizedBox(height: 12),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: context.loc.commandTitle,
              isDense: true,
              border: const OutlineInputBorder(),
            ),
          ),
          AppStyles.spacingH8,
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: context.loc.commandDescription,
              isDense: true,
              border: const OutlineInputBorder(),
            ),
          ),
          AppStyles.spacingH8,
          TextField(
            controller: commandController,
            decoration: InputDecoration(
              labelText: context.loc.command,
              isDense: true,
              border: const OutlineInputBorder(),
              hintText: 'dumpsys meminfo %p',
            ),
          ),
          const SizedBox(height: 12),
          UsefulCommandsPlaceholderReference(packageName: packageName, appInfo: appInfo),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => context.read<UsefulCommandsUiBloc>().add(const UsefulCommandsUiEvent.hideAddForm()),
                child: Text(context.loc.cancel),
              ),
              AppStyles.spacing8,
              FilledButton(
                onPressed: () => _addCustomCommand(context),
                child: Text(context.loc.addCommand),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
