import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_application/presentation/bloc/auth/auth_bloc.dart';
import 'package:profile_application/presentation/bloc/auth/auth_event.dart';
import 'package:profile_application/presentation/bloc/auth/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? 'Login' : 'Register')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (!isLogin)
                TextField(
                  controller: name,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
              TextField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
      ElevatedButton(
  onPressed: () {
    if (isLogin) {
      context.read<AuthBloc>().add(
        LoginRequested(
          email: email.text,
          password: password.text,
        ),
      );
    } else {
      context.read<AuthBloc>().add(
        RegisterRequested(
          name: name.text,
          email: email.text,
          password: password.text,
        ),
      );
    }
  },
  child: Text(isLogin ? 'Login' : 'Register'),
),


              TextButton(
                onPressed: () => setState(() => isLogin = !isLogin),
                child: Text(isLogin
                    ? 'Create account'
                    : 'Already have an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
