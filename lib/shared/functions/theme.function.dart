import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:taskifie/shared/data/theme.data.dart';

bool isSystemOnDarkMode() =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
    Brightness.dark;

ThemeData getAppThemeData() =>
    isSystemOnDarkMode() ? darkThemeData : lightThemeData;
