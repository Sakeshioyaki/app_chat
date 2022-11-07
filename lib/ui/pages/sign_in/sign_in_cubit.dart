import 'package:equatable/equatable.dart';
import 'package:flutter_base/blocs/app_cubit.dart';
import 'package:flutter_base/models/enums/load_status.dart';
import 'package:flutter_base/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/user_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepo;
  final UserRepository userRepo;
  final AppCubit appCubit;

  SignInCubit({
    required this.authRepo,
    required this.userRepo,
    required this.appCubit,
  }) : super(const SignInState());

  void changeUserProfile({
    required String firstName,
    String? lastName,
  }) {
    emit(state.copyWith(firstName: firstName, lastName: lastName));
  }

  void changePhone({
    required String phone,
  }) {
    emit(state.copyWith(phone: phone));
  }
}
