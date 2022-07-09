import 'package:bke/data/models/auth_reponse.dart';
import 'package:bke/data/models/data_exception.dart';
import 'package:equatable/equatable.dart';

import '../../utils/enum.dart';

class AuthState extends Equatable {
  final Status status;
  final AuthResponse? data;
  final DataException? error;

  const AuthState(this.status, {this.data, this.error});

  @override
  List<Object?> get props => [status, data, error];
}
