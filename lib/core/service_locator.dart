import 'package:get_it/get_it.dart';

import '../modules/AuthModule/data/repository/auth_repo_imp.dart';
import '../modules/AuthModule/presentation/view_model/sign_in_cubit.dart';
import '../modules/AuthModule/presentation/view_model/sign_up_cubit.dart';

final getIt=GetIt.instance;
void settUp(){
  getIt.registerSingleton<AuthenticationRepositoryImp> (AuthenticationRepositoryImp());

  getIt.registerFactory<SignInCubit>(() =>SignInCubit(getIt.get<AuthenticationRepositoryImp>()));


 getIt.registerFactory<SignUpCubit>(() =>SignUpCubit(getIt.get<AuthenticationRepositoryImp>()));
}