
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patiant_app/modules/homeModule/presentatiion/view_model/profile_view_states.dart';

import '../../../../core/network/app_const.dart';
import '../../../AuthModule/data/model/user_model.dart';

class ProfileCubit extends Cubit<ProfileCubitStates> {
  ProfileCubit() : super(ProfileCubitInitialStates());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);
  UserModel? userModel;
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController address=TextEditingController();
  Future<void> getUserData() async {
    emit(ProfileCubitLoadingStates());
    await FirebaseFirestore.instance.collection('Users')
        .doc(AppConsts.uIdUser)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(ProfileCubitSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileCubitErrorStates(error: error.toString()));
    });
  }
}