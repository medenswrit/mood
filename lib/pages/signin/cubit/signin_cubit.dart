import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mood/data/models/custom_error.dart';
import 'package:mood/data/repositories/auth_repository.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;
  SigninCubit({required this.authRepository}) : super(SigninState.initial());

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(signinStatus: SigninStatus.submitting));

    try {
      await authRepository.logInWithGoogle();

      emit(state.copyWith(signinStatus: SigninStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signinStatus: SigninStatus.error,
          error: e,
        ),
      );
    }
  }
}
