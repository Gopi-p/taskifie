import 'package:flutter/material.dart';
import 'package:taskifie/shared/data/theme.data.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.enabled = true,
    this.autofocus = false,
    this.initialValue,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLength,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.validator,
    this.suffixIcon,
  });

  final String label;
  final String hintText;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final bool readOnly;
  final String? initialValue;
  final int? maxLength;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.caption1),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            constraints: const BoxConstraints(maxWidth: 400),
          ),
          style: AppTextStyle.body2,
          cursorColor: AppColors.linkBlue,
          enabled: enabled,
          autofocus: autofocus,
          initialValue: initialValue,
          obscureText: obscureText,
          readOnly: readOnly,
          maxLength: maxLength,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,
          onTap: onTap,
          onTapOutside: onTapOutside,
        ),
      ],
    );
  }
}
