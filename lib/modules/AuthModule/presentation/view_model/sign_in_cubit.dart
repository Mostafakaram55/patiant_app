import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patiant_app/modules/AuthModule/presentation/view_model/sign_in_states.dart';
import '../../../../core/error/error_app.dart';
import '../../data/repository/auth_repo.dart';

class SignInCubit extends Cubit<SignInstates>{
  SignInCubit(this.authenticationRepository):super (InitialStateSignIn());
  static SignInCubit get(BuildContext context)=>BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();
  final  AuthenticationRepository authenticationRepository;
  bool isObscureText=true;
  void changevalue(){
    isObscureText=!isObscureText;
    emit(cahnge());
  }
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  Future<void> logIn({required String email ,required String password})async {
    emit(LoadingStateSignIn());
    Either<ErrorApp,UserCredential> result= await authenticationRepository.login(
        email: email,
        password: password
    );
    result.fold((error){
      emit(ErrorStateSignIn(error: error.toString()));
    }, (user) {
      emit(SuccessStateSignIn(userCredential: user));
    });
  }


}