import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/command_log_commands_ui_bloc/command_log_commands_ui_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/useful_command.dart';

class CommandLogEditCommandForm extends StatefulWidget {
  final UsefulCommand command;

  const CommandLogEditCommandForm({super.key, required this.command});

  @override
  State<CommandLogEditCommandForm> createState() => _CommandLogEditCommandFormState();
}

class _CommandLogEditCommandFormState extends State<CommandLogEditCommandForm> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController commandController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.command.title);
    descriptionController = TextEditingController(text: widget.command.description);
    commandController = TextEditingController(text: widget.command.command);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    commandController.dispose();
    super.dispose();
  }

  void _saveCommand(BuildContext context) {
    if (titleController.text.isEmpty || commandController.text.isEmpty) return;
    getIt<UsefulCommandsBloc>().add(
      UsefulCommandsEvent.updateCommand(
        id: widget.command.id,
        title: titleController.text,
        description: descriptionController.text,
        command: commandController.text,
      ),
    );
    context.read<CommandLogCommandsUiBloc>().add(const CommandLogCommandsUiEvent.setEditingCommand(null));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.editCommand, style: AppStyles.titleStyle.copyWith(fontSize: 14)),
          SizedBox(height: 12),
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
              hintText: context.loc.commandHintExample,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => context.read<CommandLogCommandsUiBloc>().add(const CommandLogCommandsUiEvent.setEditingCommand(null)),
                child: Text(context.loc.cancel),
              ),
              AppStyles.spacing8,
              FilledButton(
                onPressed: () => _saveCommand(context),
                child: Text(context.loc.editCommand),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
