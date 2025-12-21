import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/extensions.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;
  final Color? color;
  final bool? sortAscending;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.color,
    this.sortAscending,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label.capitalize()),
          if (isSelected && sortAscending != null) ...[
            SizedBox(width: 4.w),
            Icon(
              sortAscending! ? Icons.arrow_upward : Icons.arrow_downward,
              size: 14.sp,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
          ],
        ],
      ),
      selected: isSelected,
      onSelected: (_) {
        if (isSelected) {
          context.read<HomeBloc>().add(const HomeEvent.toggleSortOrder());
        } else {
          onSelected();
        }
      },
      selectedColor: color?.withValues(alpha: 0.3) ?? Theme.of(context).colorScheme.primaryContainer,
      checkmarkColor: color ?? Theme.of(context).colorScheme.primary,
      side: isSelected && color != null ? BorderSide(color: color!, width: 1) : null,
    );
  }
}
