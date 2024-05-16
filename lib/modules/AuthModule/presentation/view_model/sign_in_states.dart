import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInstates{
  const  SignInstates();
}

class InitialStateSignIn extends SignInstates{}
class cahnge extends SignInstates{}
class LoadingStateSignIn extends SignInstates{}



class SuccessStateSignIn extends SignInstates{
  final  UserCredential userCredential;

  const SuccessStateSignIn({required this.userCredential});
}
class ErrorStateSignIn extends SignInstates{
  final String error;

  ErrorStateSignIn({required this.error});
}