import 'package:profile_application/Domain/entities/user_entity.dart';
import 'package:profile_application/domain/repositories/auth_repositories.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<UserEntity> call({
    required String email,
    required String password,
  }) {
    return repository.login(email, password);
  }
}
