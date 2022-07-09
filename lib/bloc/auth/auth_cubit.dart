import 'package:bke/bloc/auth/auth_state.dart';
import 'package:bke/data/models/data_exception.dart';
import 'package:bke/utils/enum.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/app_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AppRepository repository = AppRepository();

  AuthCubit() : super(const AuthState(Status.initial));

  void doLogin(String email, String password) async {
    emit(const AuthState(Status.loading));
    try {
      final response = await repository.doLogin(email, password);
      emit(AuthState(Status.success, data: response));
    } on DataException catch (e) {
      emit(AuthState(Status.failure, error: e));
    }
  }
}
