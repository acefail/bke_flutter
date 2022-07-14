import 'package:bke/bloc/auth/auth_cubit.dart';
import 'package:bke/bloc/auth/auth_state.dart';
import 'package:bke/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 150,
              height: 150,
              child: Icon(Icons.android, size: 80),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage('images/HCMUT_official_logo.png'),
                //   fit: BoxFit.cover,
                // ),
                color: Colors.grey[100],
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 6,
                      spreadRadius: 3,
                      offset: Offset(6, 2)),
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      blurRadius: 6,
                      spreadRadius: 3,
                      offset: Offset(-6, -2))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome',
              style: TextStyle(color: Colors.grey[500]),
            ),
            Text(
              'Sign in',
              style: boldTextStyle(
                  size: 30,
                  fontFamily: GoogleFonts.playfairDisplay().fontFamily),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(6, 2),
                    blurRadius: 6,
                    spreadRadius: 3,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    offset: Offset(-6, -2),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: const Center(child: Text('Email')),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(6, 2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    offset: Offset(-6, -2),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  label: const Center(child: Text('Password')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'or',
                style: TextStyle(fontSize: 12, color: Colors.grey[400]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(6, 2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                            offset: Offset(-6, -2),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(6, 2),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          offset: Offset(-6, -2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(6, 2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                            offset: Offset(-6, -2),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 89, 132, 252),
                      Color.fromARGB(255, 151, 72, 255),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    print(emailController.text);
                    print(passController.text);
                    context.read<AuthCubit>().doLogin(
                          emailController.text,
                          passController.text,
                        );
                  },
                  child: Text(
                    'Log In',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Netflix",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
      ),
    );
  }
}
