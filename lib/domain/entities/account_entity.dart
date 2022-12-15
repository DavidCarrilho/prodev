import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String token;

  @override
  List get props => [token];

  AccountEntity(this.token);


  // AccountEntity copyWith({
  //   String token,
  // }) {
  //   return AccountEntity(
  //     token: token ?? this.token,
  //   );
  // }
}
