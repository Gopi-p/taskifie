import 'package:flutter/material.dart';
import 'package:taskifie/shared/data/typography.data.dart';
import 'package:taskifie/shared/services/general.service.dart';

void showSnackBar({
  required String msg,
  ToastType type = ToastType.info,
}) {
  Color? textColor;
  Color? bgColor;

  switch (type) {
    case ToastType.success:
      bgColor = Colors.green[400];
      textColor = Colors.grey[100];
      break;
    case ToastType.error:
      bgColor = Colors.red[400];
      textColor = Colors.grey[100];
      break;
    case ToastType.warning:
      bgColor = Colors.orange[300];
      textColor = Colors.black;
      break;
    default:
      bgColor = Colors.grey[200];
      textColor = Colors.grey[850];
  }

  var snackBar = SnackBar(
    backgroundColor: bgColor,
    width: 375,
    behavior: SnackBarBehavior.floating,
    content: Text(
      msg,
      style: TextStyles.textSm.copyWith(color: textColor),
    ),
  );

  ScaffoldMessenger.of(GeneralService.o.getContext).showSnackBar(snackBar);
}

enum ToastType {
  success,
  error,
  warning,
  info,
}
