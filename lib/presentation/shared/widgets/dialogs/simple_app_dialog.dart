import 'package:detective/presentation/shared/theme/dimensions.dart';
import 'package:flutter/material.dart';

class SimpleAppDialog extends StatelessWidget {
  final Widget? title;
  final Widget? description;
  final List<Widget> actions;
  final bool isMobile;

  const SimpleAppDialog({
    super.key,
    required this.isMobile,
    this.title,
    this.description,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: isMobile
          ? const EdgeInsets.symmetric(
              horizontal: 8,
            )
          : null,
      backgroundColor: Theme.of(context).colorScheme.primary,
      scrollable: true,
      content: Container(
        constraints: const BoxConstraints(maxWidth: 450),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title ?? const SizedBox.shrink(),
              AppSpacing.h16,
              description ?? const SizedBox.shrink(),
              AppSpacing.h24,
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: actions,
              )
            ],
          ),
        ),
      ),
    );
  }
}
