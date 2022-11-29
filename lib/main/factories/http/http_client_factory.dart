import 'package:http/http.dart';
import 'package:prodev/data/http/http.dart';
import 'package:prodev/infra/http/http.dart';

HttpClient makeHttpAdapter() {
  final client = Client();
  return HttpAdapter(client);
}
