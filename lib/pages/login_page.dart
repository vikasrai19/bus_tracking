import 'package:bus_tracking/blocs/auth_bloc/auth_bloc.dart';
import 'package:bus_tracking/blocs/auth_bloc/auth_event.dart';
import 'package:bus_tracking/blocs/auth_bloc/auth_state.dart';
import 'package:bus_tracking/pages/main_page.dart';
import 'package:bus_tracking/widgets/custom_snackbar.dart';
import 'package:bus_tracking/widgets/landing_page_image.dart';
import 'package:bus_tracking/widgets/primary_button.dart';
import 'package:bus_tracking/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.black.withOpacity(0.9),
                        ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Login And Track your bus easily !',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const LandingPageImage(),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: emailController,
                            placeholder: 'Enter Email',
                            label: 'Email',
                            onChange: () {},
                            leadingWidget: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            trailingWidget: const SizedBox(),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          CustomTextField(
                            controller: passwordController,
                            placeholder: 'Enter Password',
                            label: 'Password',
                            isObscure: true,
                            onChange: () {},
                            leadingWidget: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            trailingWidget: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.2,
                          ),
                          BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                            if (state is AuthSuccessState) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            } else if (state is AuthErrorState) {}
                          }, builder: (context, state) {
                            if (state is AuthInitialState ||
                                state is AuthSuccessState ||
                                state is AuthErrorState) {
                              return PrimaryButton(
                                buttonName: 'Login',
                                onPressed: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    SignInUserEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context,
                                    ),
                                  );
                                },
                              );
                            }
                            return const CircularProgressIndicator();
                          }),
                        ],
                      )),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
