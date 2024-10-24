import 'package:bloc/bloc.dart';
import 'package:clinic/features/Auth/signUp/domain/useCase/auth_usecase.dart';
import 'package:clinic/features/Auth/signUp/presentation/manager/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial());

  // عملية التسجيل
  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      await signUpUseCase.call(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // عملية تسجيل الدخول
  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await signInUseCase.call(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  // عملية تسجيل الخروج
  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await signOutUseCase.call();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}