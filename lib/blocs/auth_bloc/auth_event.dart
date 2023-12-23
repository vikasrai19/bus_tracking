import 'package:flutter/material.dart';

abstract class AuthEvent {}

class SignInUserEvent extends AuthEvent {
  final String? email;
  final String? password;
  final BuildContext? context;

  SignInUserEvent({this.email, this.password, this.context});
}
