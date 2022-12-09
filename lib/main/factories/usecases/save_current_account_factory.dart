import 'package:prodev/data/usecases/usecases.dart';
import 'package:prodev/domain/usecases/usecases.dart';

import '../factories.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
   saveSecureCacheStorage: makeLocalStoraAdapter()
  );
}
