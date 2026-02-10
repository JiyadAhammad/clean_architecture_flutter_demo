import 'package:flutter/material.dart';

enum AppTextStyle {
  displayLarge,
  displayMedium,
  displaySmall,

  headlineLarge,
  headlineMedium,
  headlineSmall,

  titleLarge,
  titleMedium,
  titleSmall,

  bodyLarge,
  bodyMedium,
  bodySmall,

  labelLarge,
  labelMedium,
  labelSmall,
}

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    required this.style,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });
  final String text;
  final AppTextStyle style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? resolvedStyle = _resolveStyle(textTheme);

    if (color != null) {
      resolvedStyle = resolvedStyle?.copyWith(color: color);
    }

    return Text(
      text,
      style: resolvedStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle? _resolveStyle(TextTheme textTheme) {
    switch (style) {
      case AppTextStyle.displayLarge:
        return textTheme.displayLarge;
      case AppTextStyle.displayMedium:
        return textTheme.displayMedium;
      case AppTextStyle.displaySmall:
        return textTheme.displaySmall;

      case AppTextStyle.headlineLarge:
        return textTheme.headlineLarge;
      case AppTextStyle.headlineMedium:
        return textTheme.headlineMedium;
      case AppTextStyle.headlineSmall:
        return textTheme.headlineSmall;

      case AppTextStyle.titleLarge:
        return textTheme.titleLarge;
      case AppTextStyle.titleMedium:
        return textTheme.titleMedium;
      case AppTextStyle.titleSmall:
        return textTheme.titleSmall;

      case AppTextStyle.bodyLarge:
        return textTheme.bodyLarge;
      case AppTextStyle.bodyMedium:
        return textTheme.bodyMedium;
      case AppTextStyle.bodySmall:
        return textTheme.bodySmall;

      case AppTextStyle.labelLarge:
        return textTheme.labelLarge;
      case AppTextStyle.labelMedium:
        return textTheme.labelMedium;
      case AppTextStyle.labelSmall:
        return textTheme.labelSmall;
    }
  }
}
