import 'package:json_annotation/json_annotation.dart';

part 'user.interface.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  explicitToJson: true,
  includeIfNull: false,
)
class UserDetails {
  final String userId;
  final String name;
  final String email;
  final String? mobile;
  final String? dob;
  final String? gender;
  final String? address;
  final String? profileUrl;
  final UserSettings? settings;

  UserDetails({
    required this.userId,
    required this.name,
    required this.email,
    this.mobile,
    this.dob,
    this.gender,
    this.address,
    this.profileUrl,
    this.settings,
  });
  factory UserDetails.fromJson(Map<String, dynamic> data) =>
      _$UserDetailsFromJson(data);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  explicitToJson: true,
  includeIfNull: false,
)
class UserSettings {
  final String language;
  final AppThemeMode theme;
  final bool promptOnDelete;

  UserSettings({
    this.language = 'en',
    this.theme = AppThemeMode.system,
    this.promptOnDelete = true,
  });

  factory UserSettings.fromJson(Map<String, dynamic> data) =>
      _$UserSettingsFromJson(data);
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

enum AppThemeMode {
  light,
  dark,
  system,
}
