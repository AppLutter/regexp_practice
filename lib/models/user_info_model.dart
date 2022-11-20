import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoModel {
  final String name;
  final String phoneNumber;
  final String residentNumber;
  final String eMail;

  const UserInfoModel({
    required this.name,
    required this.phoneNumber,
    required this.residentNumber,
    required this.eMail,
  });
}
