 class UserState {}

final class UserInitial extends UserState {}
 final class UploadProfilePic extends UserState {}
 final class SignInLoading extends UserState {}
 final class SignInSucsses extends UserState {}
 final class SignInFaliuer extends UserState {
   final String erromessage;

   SignInFaliuer({required this.erromessage});
 }
 final class SignUpLoading extends UserState {}
 final class SignUpSucsses extends UserState {
  final String message;

  SignUpSucsses({required this.message});
 }
 final class SignUpFaliuer extends UserState {
   final String erromessage;

   SignUpFaliuer({required this.erromessage});
 }
