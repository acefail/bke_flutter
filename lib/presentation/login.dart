import 'package:bke/bloc/auth/auth_cubit.dart';
import 'package:bke/bloc/auth/auth_state.dart';
import 'package:bke/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: passController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(emailController.text);
              print(passController.text);
              context.read<AuthCubit>().doLogin(
                    emailController.text,
                    passController.text,
                  );
            },
            child: Text('Login'),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state.status == Status.failure) {
                return Text(
                    'error - ${state.error?.message ?? 'unknown err'} ');
              } else if (state.status == Status.loading) {
                return const Text('Loading');
              } else if (state.status == Status.success) {
                return Text('OK - ${state.data?.user?.fullName ?? 'abc'}');
              }

              return SizedBox();
            },
          )
        ],
      ),
    );
  }
}
