import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpStates{
  const SignUpStates();
}
class InitialStateSignUpStates extends SignUpStates{}
class LoadingStateSSignUpStates extends SignUpStates{}
class SelectedValueStates extends SignUpStates{}
class SuccessStateSignUpStates extends SignUpStates{
  final  UserCredential userCredential ;

  const SuccessStateSignUpStates({required this.userCredential});
}
class ErrorStateSignUpStates extends SignUpStates{
  final String error;

  ErrorStateSignUpStates({required this.error});
}

class LoadingStateSaveDataStates extends SignUpStates{}
class SuccessStateSaveDataStates extends SignUpStates{
  final  String message ;

  const SuccessStateSaveDataStates({required this.message});
}
class ErrorStateSaveDataStates extends SignUpStates{
  final String error;

  ErrorStateSaveDataStates({required this.error});
}