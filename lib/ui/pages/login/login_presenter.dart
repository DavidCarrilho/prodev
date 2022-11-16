abstract class LoginPresenter {
  Stream get emailErrorStream;
  Stream get passwordlErrorStream;
  Stream get isFormValidStream;

  void validateEmail(String email);
  void validatePassword(String password);


}