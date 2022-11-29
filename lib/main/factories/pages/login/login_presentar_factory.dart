import 'package:prodev/presentation/presenters/presenters.dart';
import 'package:prodev/ui/pages/pages.dart';

import '../../factories.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
    authentication: makeRemoteAuthentication(),
    validation: makeLoginValidation(),
  );
}
