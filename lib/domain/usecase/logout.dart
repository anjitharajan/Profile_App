import 'package:profile_application/domain/repositories/auth_repositories.dart';

class Logout {
  final AuthRepository repo;
  Logout(this.repo);
  Future<void> call() => repo.logout();
}
