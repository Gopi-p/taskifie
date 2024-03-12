// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String?,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      profileUrl: json['profileUrl'] as String?,
      settings: json['settings'] == null
          ? null
          : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) {
  final val = <String, dynamic>{
    'userId': instance.userId,
    'name': instance.name,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mobile', instance.mobile);
  writeNotNull('dob', instance.dob);
  writeNotNull('gender', instance.gender);
  writeNotNull('address', instance.address);
  writeNotNull('profileUrl', instance.profileUrl);
  writeNotNull('settings', instance.settings?.toJson());
  return val;
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
      language: json['language'] as String? ?? 'en',
      theme: $enumDecodeNullable(_$AppThemeModeEnumMap, json['theme']) ??
          AppThemeMode.system,
      promptOnDelete: json['promptOnDelete'] as bool? ?? true,
    );

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': _$AppThemeModeEnumMap[instance.theme]!,
      'promptOnDelete': instance.promptOnDelete,
    };

const _$AppThemeModeEnumMap = {
  AppThemeMode.light: 'light',
  AppThemeMode.dark: 'dark',
  AppThemeMode.system: 'system',
};
