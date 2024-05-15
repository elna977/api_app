class EndPoint {
  static String baseUrl ="https://food-api-omega.vercel.app/api/v1/";
  static String signIn ="user/signin";
  static String signUp ="user/signup";
  static String getUserData(id){
    return "user/get-user/$id";
  }
}
class ApiKeys{
  static String status ="status";
  static String erromessage ="ErrorMessage";
  static String email ="email";
  static String password ="password";
  static String token ="token";
  static String id ="id";
  static String message ="message";
  static String confirmPassword ="confirmPassword";
  static String location ="location";
  static String phone ="phone";
  static String name ="name";
  static String profilePic ="profilePic";

}