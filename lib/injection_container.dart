import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:profile_application/data/data_sources/data_source.dart';
import 'package:profile_application/domain/repositories/auth_repositories.dart';
import 'package:profile_application/data/repositories/repository_Impl.dart';
import 'domain/usecase/get_current_user.dart';
import 'domain/usecase/login.dart';
import 'domain/usecase/logout.dart';
import 'domain/usecase/register.dart';
import 'presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firebaseAuth: sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => Logout(sl()));

  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      getCurrentUser: sl(),
      login: sl(),
      register: sl(),
      logout: sl(),
    ),
  );
}
