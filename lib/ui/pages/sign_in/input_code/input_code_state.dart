part of 'input_code_cubit.dart';

class InputCodeState extends Equatable {
  final LoadStatus signInStatus;
  final String? code;
  final String? verificationCode;

  const InputCodeState(
      {this.signInStatus = LoadStatus.initial,
      this.code,
      this.verificationCode});

  @override
  List<Object?> get props => [signInStatus, code, verificationCode];

  InputCodeState copyWith(
      {LoadStatus? signInStatus, String? code, String? verificationCode}) {
    return InputCodeState(
      signInStatus: signInStatus ?? this.signInStatus,
      code: code ?? this.code,
      verificationCode: verificationCode ?? this.verificationCode,
    );
  }
}
