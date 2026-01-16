import 'package:profile_application/Domain/entities/user_entity.dart';
import 'package:profile_application/domain/repositories/auth_repositories.dart';

class GetCurrentUser {
  final AuthRepository repo;
  GetCurrentUser(this.repo);
  Future<UserEntity?> call() => repo.getCurrentUser();
}
