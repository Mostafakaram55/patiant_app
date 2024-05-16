import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patiant_app/core/service_locator.dart';
import 'package:patiant_app/modules/homeModule/presentatiion/view/home_lay_out_view.dart';

import '../modules/AuthModule/presentation/view/sign_in_view.dart';
import '../modules/AuthModule/presentation/view/sign_up_view.dart';
import '../modules/AuthModule/presentation/view_model/sign_in_cubit.dart';
import '../modules/AuthModule/presentation/view_model/sign_up_cubit.dart';
import '../modules/homeModule/presentatiion/view/profile_view.dart';

class NameRout {
  static const String splashView = '/';
  static const String logInView = '/logInView';
  static const String registerView = '/registerView';
  static const String homeLayOut = '/homeLayOut';
  static const String profileview = '/profileView';
}

class NavigationManager{
  static Route<dynamic> getRout(RouteSettings settings) {
    switch (settings.name) {
      case NameRout.logInView:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (context)=>getIt.get<SignInCubit>(),
            child: const SignInView()));
      case NameRout.registerView:
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (context) => getIt.get<SignUpCubit>(),
            child: const SignUpView()
        ));
        case NameRout.homeLayOut:
        return MaterialPageRoute(builder: (_) => const HomeLayOutView());
        case NameRout.profileview:
        return MaterialPageRoute(builder: (_) => const ProfileView());
    }
    return noFoundRoute();

  }
  static Route<dynamic> noFoundRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('NO FOUND ROUT'),
          ),
        ));
  }
}
