import 'package:bke/bloc/auth/auth_cubit.dart';
import 'package:bke/presentation/splash_screen.dart';
import 'package:bke/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: MaterialApp(
        title: 'abc',
        theme: AppThemeData.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
