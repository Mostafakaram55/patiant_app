import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patiant_app/modules/AuthModule/presentation/view_model/sign_up_states.dart';

import '../../../../core/error/error_app.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/auth_repo.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authenticationRepository)
      : super(InitialStateSignUpStates());

  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController userNameController=TextEditingController();
  TextEditingController emailRegisterController=TextEditingController();
  TextEditingController passwordRegisterController=TextEditingController();
  TextEditingController confiramPasswordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthenticationRepository authenticationRepository;
  late User user;

  Future<void> register(
      {required String email, required String password }) async {
    emit(LoadingStateSSignUpStates());
    Either<ErrorApp, UserCredential> result = await authenticationRepository
        .register(email: email, password: password);
    result.fold((error) {
      emit(ErrorStateSignUpStates(error: error.toString()));
    }, (user) {
      this.user = user.user!;
      saveUserData();
      emit(SuccessStateSignUpStates(userCredential: user));
    });
  }

  void saveUserData() async {
    emit(LoadingStateSaveDataStates());
    Either<ErrorApp, String> result =
    await authenticationRepository.saveUserData(
        userModel: UserModel(
          email: emailRegisterController.text,
          phone: phoneController.text,
          name: userNameController.text,
          uId: user.uid,
          address: addressController.text
        ));
    result.fold((error) {
      emit(ErrorStateSaveDataStates(error: error.toString()));
    }, (message) {
      emit(SuccessStateSaveDataStates(message: message.toString()));
    });
  }
}