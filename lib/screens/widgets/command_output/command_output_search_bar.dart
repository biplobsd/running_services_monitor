import 'package:flutter/material.dart';
import 'package:running_services_monitor/bloc/command_output_bloc/command_output_bloc.dart';
import 'package:running_services_monitor/core/extensions.dart';

class CommandOutputSearchBar extends StatelessWidget {
  final String searchQuery;
  final int matchCount;
  final int currentMatchIndex;
  final CommandOutputBloc bloc;
  final TextEditingController textController;
  final String outputText;

  const CommandOutputSearchBar({
    super.key,
    required this.searchQuery,
    required this.matchCount,
    required this.currentMatchIndex,
    required this.bloc,
    required this.textController,
    required this.outputText,
  });

  @override
  Widget build(BuildContext context) {
    if (textController.text != searchQuery) {
      textController.value = TextEditingValue(text: searchQuery, selection: TextSelection.collapsed(offset: searchQuery.length));
    }
    final matchLabel = matchCount == 0 ? context.loc.noMatches : context.loc.matchCount(currentMatchIndex + 1, matchCount);
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(isDense: true, border: InputBorder.none, hintText: context.loc.searchOutput),
              onChanged: (value) {
                bloc.add(CommandOutputEvent.updateSearchQuery(value, outputText));
              },
            ),
          ),
          Text(matchLabel),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_up),
            tooltip: context.loc.previousMatch,
            onPressed: matchCount == 0 ? null : () => bloc.add(const CommandOutputEvent.previousMatch()),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            tooltip: context.loc.nextMatch,
            onPressed: matchCount == 0 ? null : () => bloc.add(const CommandOutputEvent.nextMatch()),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: context.loc.close,
            onPressed: () {
              textController.clear();
              bloc.add(const CommandOutputEvent.toggleSearch());
            },
          ),
        ],
      ),
    );
  }
}
