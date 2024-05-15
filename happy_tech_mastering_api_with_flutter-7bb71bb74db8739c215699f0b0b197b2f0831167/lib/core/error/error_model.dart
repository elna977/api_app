import 'package:happy_tech_mastering_api_with_flutter/core/api/api_endpoint.dart';

class ErrorModel{
  final int status;
  final String errormessage;

  ErrorModel({required this.status, required this.errormessage});
  factory ErrorModel.formJson(Map<String,dynamic>jsonData){
    return ErrorModel(
        status: jsonData[ApiKeys.status],
        errormessage: jsonData[ApiKeys.erromessage]
    );
  }
}