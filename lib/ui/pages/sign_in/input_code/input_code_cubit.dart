import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base/blocs/app_cubit.dart';
import 'package:flutter_base/models/enums/load_status.dart';
import 'package:flutter_base/repositories/auth_repository.dart';
import 'package:flutter_base/repositories/user_repository.dart';
import 'package:flutter_base/ui/commons/app_snackbar.dart';

part 'input_code_state.dart';

class InputCodeCubit extends Cubit<InputCodeState> {
  final AuthRepository authRepo;
  final UserRepository userRepo;
  final AppCubit appCubit;
  InputCodeCubit(this.authRepo, this.userRepo, this.appCubit)
      : super(const InputCodeState());

  void enterCode({
    required String code,
  }) {
    emit(state.copyWith(code: code));
  }

  void verifyPhone({required String phone}) async {
    if (phone.isEmpty) {
      AppSnackbar.showError(message: 'Phone is empty');
      return;
    }
    final result = await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await FirebaseAuth.instance
        //     .signInWithCredential(credential)
        //     .then((value) async {
        //   if (value.user != null) {
        //     UserEntity? myProfile = await userRepo.getProfile();
        //     appCubit.updateProfile(myProfile);
        //     // authRepo.saveToken(value.);
        //     emit(state.copyWith(signInStatus: LoadStatus.success));
        //     // Get.to(() => const HomePage());
        print('wait .. user da co roi verificationCompleted');
        //   }
        // });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        emit(state.copyWith(signInStatus: LoadStatus.failure));
      },
      codeSent: (String? verificationID, int? resendToken) async {
        print("dang gui code - ${state.verificationCode}");
        emit(state.copyWith(verificationCode: verificationID));
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        emit(state.copyWith(verificationCode: verificationID));
      },
      timeout: const Duration(seconds: 120),
    );
  }

  Future<void> SignIn(String pin) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: state.verificationCode!, smsCode: pin))
          .then(
        (value) async {
          if (value.user != null) {
            print('success login');
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
