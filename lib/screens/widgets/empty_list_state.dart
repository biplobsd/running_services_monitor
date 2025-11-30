import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';

class EmptyListState extends StatelessWidget {
  final bool isSearching;

  const EmptyListState({super.key, required this.isSearching});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inbox_outlined, size: 64.w, color: Theme.of(context).colorScheme.outline),
                    SizedBox(height: 16.h),
                    Text(
                      isSearching
                          ? AppLocalizations.of(context)!.noMatchingApps
                          : AppLocalizations.of(context)!.noAppsFound,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
