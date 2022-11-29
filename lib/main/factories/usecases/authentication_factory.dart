import 'package:prodev/data/usecases/usecases.dart';
import 'package:prodev/domain/usecases/usecases.dart';
import 'package:prodev/main/factories/http/http.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(
    httpClient: makeHttpAdapter(),
    url: makeApiUrl('login'),
  );
}
