import '../core/api/api_endpoint.dart';

class SignInModel{
  final String message;
  final String token;

  SignInModel({required this.message, required this.token});
  factory SignInModel.formJson(Map<String,dynamic> jsonData){
    return SignInModel(
        message: jsonData[ApiKeys.message],
        token: jsonData[ApiKeys.token]);
  }
}