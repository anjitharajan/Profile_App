import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_application/presentation/bloc/auth/auth_state.dart';
import 'package:profile_application/Presentation/pages/home_page.dart';
import 'package:profile_application/presentation/pages/login_page.dart';
import 'package:profile_application/presentation/bloc/auth/auth_bloc.dart';
import 'package:profile_application/presentation/bloc/auth/auth_event.dart';
import 'package:profile_application/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init();

  runApp(
    BlocProvider(
      create: (_) => sl<AuthBloc>()..add(AppStarted()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const HomePage();
          }
          if (state is AuthUnauthenticated) {
            return const LoginPage();
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
