import 'package:prodev/main/factories/usecases/usecases.dart';
import 'package:prodev/presentation/presenters/presenters.dart';
import 'package:prodev/ui/pages/splash/splash.dart';

// SplashPresenter makeStreamSplashPresenter() {
//   return StreamSplashPresenter(
//     authentication: makeRemoteAuthentication(),
//     validation: makeSplashValidation(),
//   );
// }

SplashPresenter makeGetxSplashPresenter() {
  return GetxSplashPresenter(
    loadCurrentAccount: makeLocalLoadCurrentAccount(),
  );
}
