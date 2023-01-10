import 'package:prodev/data/usecases/usecases.dart';
import 'package:prodev/domain/usecases/usecases.dart';
import 'package:prodev/main/factories/cache/cache.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(
    fetchSecureCacheStorage: makeLocalStoraAdapter()
  );
}
