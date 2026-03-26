import 'package:kinyaana/features/auth/domain/entities/user_entity.dart';
import 'package:kinyaana/features/auth/domain/repositoties/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repo;

  SignupUseCase(this.repo);

  Future<UserEntity> call(String emial, String password) {
    return repo.signup(emial, password);
  }

}