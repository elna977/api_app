import 'package:happy_tech_mastering_api_with_flutter/core/api/api_endpoint.dart';

class GetUserDataModel{
  final String name;
  final String profilePic;
  final String email;
  final String phone;
  final Map<String,dynamic> location;

  GetUserDataModel({required this.name, required this.profilePic, required this.email, required this.phone, required this.location});
  factory GetUserDataModel.fromJson(Map<String,dynamic> jsonData){
    return GetUserDataModel(
        name: jsonData['user'][ApiKeys.name],
        profilePic: jsonData['user'][ApiKeys.profilePic],
        email: jsonData['user'][ApiKeys.email],
        phone:jsonData['user'][ApiKeys.phone],
        location: jsonData['user'][ApiKeys.location]);
  }
}