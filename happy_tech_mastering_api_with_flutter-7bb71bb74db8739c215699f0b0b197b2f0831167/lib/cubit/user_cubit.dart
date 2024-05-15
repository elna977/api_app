import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/functions/upload_image_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/model/signUpModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../core/api/api_consumer.dart';
import '../core/api/api_endpoint.dart';
import '../core/error/exception.dart';
import '../model/sinInModel.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiCounsumer api;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  SignInModel? user;
  UploadImage(XFile image){
    profilePic =image;
    emit(UploadProfilePic());
  }
  SignUp()async{
    try{
      emit(SignUpLoading());
      final response =await api.post(
        EndPoint.signUp,
        isFormData: true,
        data: {
          ApiKeys.name :signUpName.toString(),
          ApiKeys.email :signUpEmail.toString(),
          ApiKeys.phone :signUpPhoneNumber.toString(),
          ApiKeys.password :signUpPassword.toString(),
          ApiKeys.confirmPassword :confirmPassword.toString(),
          ApiKeys.location :{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]},
          ApiKeys.profilePic : await UploadImageToApi(profilePic!),
        }
      );
      final signUpModel =SignUpModel.fromJson(response);
      emit(SignUpSucsses(
        message: signUpModel.message
      ));
    }on ServerException catch(e){
      emit(SignUpFaliuer(erromessage: e.errorModel.errormessage));
    }
  }
  signIn() async{
    try{
      emit(SignInLoading());
      final response=await api.post(
          EndPoint.signIn,
          data:{
            ApiKeys.email =signInEmail.toString(),
            ApiKeys.password =signInPassword.toString(),
          }
      );
      user =SignInModel.formJson(response);
      final decodedToken =JwtDecoder.decode(user!.token);
      //id
      CacheHelper().saveData(key: ApiKeys.token, value: user!.token);
      CacheHelper().saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      emit(SignInSucsses());
    }on ServerException catch(e){
      emit(SignInFaliuer(erromessage: e.errorModel.errormessage));
    }
  }
}
