 class UserState {}

final class UserInitial extends UserState {}
 final class SignInLoading extends UserState {}
 final class SignInSucsses extends UserState {}
 final class SignInFaliuer extends UserState {
   final String erromessage;

   SignInFaliuer({required this.erromessage});
 }
