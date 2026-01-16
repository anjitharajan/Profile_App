import 'package:profile_application/Domain/entities/user_entity.dart';
import 'package:profile_application/domain/repositories/auth_repositories.dart';

class Register {
  final AuthRepository repo;
  Register(this.repo);
  Future<UserEntity> call({
    required String name,
    required String email,
    required String password,
  }) {
    return repo.register(name, email, password);
  }
}
