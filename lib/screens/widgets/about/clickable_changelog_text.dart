import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:running_services_monitor/core/constants.dart';

class ClickableChangelogText extends StatelessWidget {
  final String text;

  const ClickableChangelogText({super.key, required this.text});

  Future<void> launchBrowserUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  String preprocessMarkdown(String rawText) {
    final usernameRegex = RegExp(r'(?<=^|\s)@([a-zA-Z0-9-]+)');
    final issueRegex = RegExp(r'(?<=^|\s)#([0-9]+)');

    var processed = rawText.replaceAllMapped(usernameRegex, (match) {
      final matchedText = match.group(0)!;
      final username = match.group(1)!;
      return '[$matchedText](https://github.com/$username)';
    });

    processed = processed.replaceAllMapped(issueRegex, (match) {
      final matchedText = match.group(0)!;
      final prNumber = match.group(1)!;
      return '[$matchedText](${AppConstants.sourceCodeUrl}/issues/$prNumber)';
    });

    return processed;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final processedText = preprocessMarkdown(text);

    return MarkdownBody(
      data: processedText,
      onTapLink: (text, href, title) {
        if (href != null) {
          launchBrowserUrl(href);
        }
      },
      styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
        p: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 13,
          height: 1.4,
        ),
        a: TextStyle(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
