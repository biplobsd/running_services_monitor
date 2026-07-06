import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/models/changelog_info.dart';
import 'package:running_services_monitor/utils/url_launcher_helper.dart';
import 'clickable_changelog_text.dart';

class ChangelogListTile extends StatelessWidget {
  final ChangelogInfo changelog;

  const ChangelogListTile({super.key, required this.changelog});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final parsedDate = DateTime.tryParse(changelog.date);
    final formattedDate = parsedDate != null
        ? DateFormat.yMMMd().format(parsedDate)
        : changelog.date;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              final url =
                  '${AppConstants.sourceCodeUrl}/releases/tag/${changelog.version}';
              UrlLauncherHelper.launchExternalUrl(url);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          changelog.title.isEmpty
                              ? changelog.version
                              : changelog.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 11,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.open_in_new_rounded,
                    size: 18,
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClickableChangelogText(text: changelog.body),
          ),
        ],
      ),
    );
  }
}
