import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

void gotoUrl(
  String urlString, {
  LaunchMode mode = LaunchMode.externalApplication,
}) async {
  Uri url = Uri.parse(urlString);
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  } catch (err) {
    // ignore: avoid_print
    print(err);
  }
}

Map<String, dynamic>? tryParseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    return null;
  }

  final payload = parts[1];
  var normalized = base64Url.normalize(payload);
  var resp = utf8.decode(base64Url.decode(normalized));
  final payloadMap = json.decode(resp);
  if (payloadMap is! Map<String, dynamic>) {
    return null;
  }
  return payloadMap;
}

extension StringExtensions on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String minutes = twoDigits(duration.inMinutes);
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
}

extension RemoveNullValues on Map<String, dynamic> {
  Map<String, dynamic> removeNullValues() {
    return Map.fromEntries(
      entries.where((e) {
        if (e.value is Map<String, dynamic>) {
          // Recursively remove null values from nested maps
          final nestedCleanedMap =
              (e.value as Map<String, dynamic>).removeNullValues();

          // Exclude entries where the nested map becomes empty after cleaning
          return nestedCleanedMap.isNotEmpty;
        }

        // Include entries that are not null
        return e.value != null;
      }),
    );
  }
}

extension NullCheck<T> on T {
  bool get isNotNull => this != null;
  bool get isNull => this == null;
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}
