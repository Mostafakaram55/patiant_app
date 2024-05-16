import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patiant_app/firebase_options.dart';
import 'package:patiant_app/modules/AuthModule/presentation/view/sign_in_view.dart';
import 'package:patiant_app/modules/AuthModule/presentation/view_model/sign_in_cubit.dart';
import 'package:patiant_app/modules/homeModule/presentatiion/view/home_lay_out_view.dart';
import 'bloc.dart';
import 'core/network/app_const.dart';
import 'core/network/cach.dart';
import 'core/rout_manager.dart';
import 'core/service_locator.dart';
import 'modules/AuthModule/presentation/view/sign_up_view.dart';
import 'modules/AuthModule/presentation/view_model/sign_up_cubit.dart';
import 'modules/homeModule/presentatiion/view_model/profile_view_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  settUp();
  Bloc.observer= MyBlocObserver();
  AppConsts.uIdUser= await CashHelper.readData()??'';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>getIt.get<SignInCubit>()),
            BlocProvider(create: (context)=>ProfileCubit()),
          ],
          child: MaterialApp(
           debugShowCheckedModeBanner: false,
            onGenerateRoute: NavigationManager.getRout,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
              useMaterial3: true,
            ),
            home: AppConsts.uIdUser.isEmpty?  const SignInView():const HomeLayOutView(),
          ),
        );
      },
    );
  }
}


