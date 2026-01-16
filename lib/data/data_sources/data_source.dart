import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  User? getCurrentUser();
  Future<User> login(String email, String password);
  Future<User> register(String name, String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  User? getCurrentUser() => firebaseAuth.currentUser;

  @override
  Future<User> login(String email, String password) async {
    final cred = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user!;
  }

  @override
  Future<User> register(String name, String email, String password) async {
    final cred = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await cred.user!.updateDisplayName(name);
    return firebaseAuth.currentUser!;
  }

  @override
  Future<void> logout() => firebaseAuth.signOut();
}
