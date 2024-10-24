

import 'package:clinic/features/Auth/signUp/domain/repos/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signUp(email, password);
  }
}

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.signIn(email, password);
  }
}

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call() {
    return repository.signOut();
  }
}
