import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class AutoRefreshTimerButton extends StatelessWidget {
  final bool isEnabled;
  final Duration? currentInterval;
  final VoidCallback onToggle;
  final void Function(Duration) onIntervalSelected;

  static const List<Duration> defaultIntervals = [Duration(milliseconds: 500), Duration(seconds: 1), Duration(seconds: 3), Duration(seconds: 5)];

  const AutoRefreshTimerButton({super.key, required this.isEnabled, required this.currentInterval, required this.onToggle, required this.onIntervalSelected});

  String _formatDuration(Duration d) {
    if (d.inMilliseconds < 1000) {
      return '${d.inMilliseconds}ms';
    }
    return '${d.inSeconds}s';
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Object>(
      onSelected: (value) {
        if (value is Duration) {
          onIntervalSelected(value);
        } else if (value == 'stop') {
          onToggle();
        }
      },
      itemBuilder: (context) => [
        ...defaultIntervals.map((interval) {
          final isSelected = currentInterval == interval && isEnabled;
          return PopupMenuItem<Duration>(
            value: interval,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelected) Icon(Icons.check, size: 18.sp, color: Theme.of(context).colorScheme.primary) else SizedBox(width: 18.sp),
                AppStyles.spacingH8,
                Text(_formatDuration(interval)),
              ],
            ),
          );
        }),
        if (isEnabled) ...[
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            value: 'stop',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.stop, size: 18.sp, color: Theme.of(context).colorScheme.error),
                AppStyles.spacingH8,
                Text('Stop', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ],
            ),
          ),
        ],
      ],
      icon: isEnabled ? AppStyles.timerIcon : AppStyles.timerOffIcon,
      // icon: Icon(isEnabled ? Icons.timer : Icons.timer_off, color: isEnabled ? Theme.of(context).colorScheme.primary : null),
      tooltip: isEnabled ? 'Auto-refresh: ${currentInterval != null ? _formatDuration(currentInterval!) : "ON"}' : 'Auto-refresh: OFF',
    );
  }
}
