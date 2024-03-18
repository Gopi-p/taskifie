import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskifie/shared/data/theme.data.dart';

enum ButtonType {
  link,
  primary,
  outline,
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool disabled;
  final bool loading;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final MainAxisAlignment contentAlignment;
  final ButtonType buttonType;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.disabled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.contentAlignment = MainAxisAlignment.start,
    this.buttonType = ButtonType.primary,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget finalChild;
    Widget mainChild = Row(
      mainAxisAlignment: contentAlignment,
      children: [
        if (prefixIcon != null) Icon(prefixIcon, color: Colors.white),
        if (prefixIcon != null) const SizedBox(width: 12),
        Text(
          text,
          style: AppTheme.textXs.copyWith(
            color: buttonType == ButtonType.link ? Colors.blue : Colors.white,
          ),
        ),
        if (suffixIcon != null) const SizedBox(width: 12),
        if (suffixIcon != null) Icon(suffixIcon, color: Colors.white),
      ],
    );

    if (!loading) {
      if (buttonType == ButtonType.link) {
        finalChild = MouseRegion(
          cursor: disabled
              ? SystemMouseCursors.forbidden
              : SystemMouseCursors.click,

          /// [GestureDetector] will not have its own focus node, here [Focus] widget is used to
          /// add this link button to the focus tree when user presses the `tab` key to move
          /// focus from one widget to another.
          child: Focus(
            /// [Focus] widget is helping us to just gain the focus, any key action must be handled
            /// separately using either [onKey] or [onKeyEvent]
            onKey: (FocusNode node, RawKeyEvent event) {
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.enter) {
                /// Calling the onTap of this button manually when the enter button is pressed
                /// while this button is focused.
                onTap.call();
                return KeyEventResult.handled;
              }
              return KeyEventResult.ignored;
            },

            child: GestureDetector(
              onTap: disabled ? null : onTap,
              child: mainChild,
            ),
          ),
        );
      } else {
        finalChild = Material(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
          child: InkWell(
            onTap: disabled ? null : onTap,
            mouseCursor: disabled
                ? SystemMouseCursors.forbidden
                : SystemMouseCursors.click,
            splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: mainChild,
            ),
          ),
        );
      }
    } else {
      finalChild = const Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation(
              Colors.blue,
            ),
          ),
        ),
      );
    }

    return Opacity(
      opacity: disabled ? .5 : 1,
      child: finalChild,
    );
  }
}

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot password?",
          style: AppTheme.textXs.copyWith(color: Colors.blue),
        ),
      ),
    );
  }
}
