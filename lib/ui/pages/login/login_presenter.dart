abstract class LoginPresenter {
  Stream<String> get emailErrorStream;
  Stream<String> get passwordlErrorStream;
  Stream<String> get mainErrorStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  void validateEmail(String email);
  void validatePassword(String password);
  Future<void> auth();
  void dispose();

}