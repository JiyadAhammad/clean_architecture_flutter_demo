import 'package:flutter/material.dart';

import '../text/app_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = isLoading ? 50 : constraints.maxWidth;
        return Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 45,
            width: width,
            child: ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.horizontal,
                      child: child,
                    ),
                  );
                },
                child: isLoading
                    ? Center(
                        child: SizedBox(
                          key: const ValueKey<String>('loader'),
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: AppText(
                          label,
                          style: AppTextStyle.labelLarge,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
