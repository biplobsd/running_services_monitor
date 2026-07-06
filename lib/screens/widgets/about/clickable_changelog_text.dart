import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:running_services_monitor/core/constants.dart';

class ClickableChangelogText extends StatelessWidget {
  final String text;

  const ClickableChangelogText({super.key, required this.text});

  Future<void> launchBrowserUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final linkStyle = TextStyle(
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    );

    final List<InlineSpan> spans = [];
    final regExp = RegExp(r'(@[a-zA-Z0-9-]+)|(#[0-9]+)');
    
    int lastMatchEnd = 0;
    final matches = regExp.allMatches(text);

    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
        ));
      }

      final matchedText = match.group(0)!;
      if (matchedText.startsWith('@')) {
        final username = matchedText.substring(1);
        final recognizer = TapGestureRecognizer()
          ..onTap = () => launchBrowserUrl('https://github.com/$username');
        spans.add(TextSpan(
          text: matchedText,
          style: linkStyle,
          recognizer: recognizer,
        ));
      } else if (matchedText.startsWith('#')) {
        final prNumber = matchedText.substring(1);
        final recognizer = TapGestureRecognizer()
          ..onTap = () => launchBrowserUrl('${AppConstants.sourceCodeUrl}/issues/$prNumber');
        spans.add(TextSpan(
          text: matchedText,
          style: linkStyle,
          recognizer: recognizer,
        ));
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
      ));
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 13,
          height: 1.4,
        ),
        children: spans,
      ),
    );
  }
}
