

import 'package:profile_application/Domain/entities/user_entity.dart';
import 'package:profile_application/data/data_sources/data_source.dart';
import 'package:profile_application/domain/repositories/auth_repositories.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = await remoteDataSource.getCurrentUser();
    if (user == null) return null;
    return UserEntity(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  @override
  Future<UserEntity> login(String email, String password) async {
    final user = await remoteDataSource.login(email, password);
    return UserEntity(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  @override
  Future<UserEntity> register(String name, String email, String password) async {
    final user = await remoteDataSource.register(name, email, password);
    return UserEntity(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  @override
  Future<void> logout() => remoteDataSource.logout();
}
