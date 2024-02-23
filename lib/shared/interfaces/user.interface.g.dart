// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      settings: json['settings'] == null
          ? null
          : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
      userDetails: json['userDetails'] == null
          ? null
          : UserBasicDetail.fromJson(
              json['userDetails'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('settings', instance.settings?.toJson());
  writeNotNull('userDetails', instance.userDetails?.toJson());
  writeNotNull('userId', instance.userId);
  return val;
}

UserBasicDetail _$UserBasicDetailFromJson(Map<String, dynamic> json) =>
    UserBasicDetail(
      name: json['name'] as String,
      email: json['email'] as String,
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      profileURL: json['profileURL'] as String?,
    );

Map<String, dynamic> _$UserBasicDetailToJson(UserBasicDetail instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dob', instance.dob);
  writeNotNull('gender', instance.gender);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('address', instance.address);
  writeNotNull('profileURL', instance.profileURL);
  return val;
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
      theme: $enumDecode(_$AppThemeModeEnumMap, json['theme']),
      language: json['language'] as String,
    );

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'theme': _$AppThemeModeEnumMap[instance.theme]!,
      'language': instance.language,
    };

const _$AppThemeModeEnumMap = {
  AppThemeMode.light: 'light',
  AppThemeMode.dark: 'dark',
  AppThemeMode.system: 'system',
};
