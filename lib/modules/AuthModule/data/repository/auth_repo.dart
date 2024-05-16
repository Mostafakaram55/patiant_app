import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:patiant_app/core/error/error_app.dart';

import '../model/user_model.dart';

abstract class AuthenticationRepository {
  Future<Either<ErrorApp, UserCredential>> login({
    required String email, required String password,
  });

  Future<Either<ErrorApp, UserCredential>> register({
    required String email,
    required String password,
  });

  Future<Either<ErrorApp, String>> saveUserData({
    required UserModel userModel,
  });
}
