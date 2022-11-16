abstract class LoginPresenter {
  Stream get emailErrorStream;
  Stream get passwordlErrorStream;

  void validateEmail(String email);
  void validatePassword(String password);


}