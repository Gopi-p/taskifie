import 'package:json_annotation/json_annotation.dart';

part 'user.interface.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  explicitToJson: true,
  includeIfNull: false,
)
class UserDetails {
  final UserSettings? settings;
  final UserBasicDetail? userDetails;
  final String? userId;

  UserDetails({
    this.settings,
    this.userDetails,
    this.userId,
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
class UserBasicDetail {
  final String name;
  final String email;
  final String? dob;
  final String? gender;
  final String? mobile;
  final String? address;
  final String? profileURL;

  UserBasicDetail({
    required this.name,
    required this.email,
    this.dob,
    this.gender,
    this.mobile,
    this.address,
    this.profileURL,
  });

  factory UserBasicDetail.fromJson(Map<String, dynamic> data) =>
      _$UserBasicDetailFromJson(data);
  Map<String, dynamic> toJson() => _$UserBasicDetailToJson(this);
}

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  explicitToJson: true,
  includeIfNull: false,
)
class UserSettings {
  final AppThemeMode theme;
  final String language;

  UserSettings({
    required this.theme,
    required this.language,
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
