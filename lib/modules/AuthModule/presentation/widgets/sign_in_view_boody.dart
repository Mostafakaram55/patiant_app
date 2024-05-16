import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:patiant_app/core/rout_manager.dart';
import '../../../../core/network/app_const.dart';
import '../../../../core/network/cach.dart';
import '../../../../core/network/controller.dart';
import '../view_model/sign_in_cubit.dart';
import '../view_model/sign_in_states.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: BlocConsumer<SignInCubit,SignInstates>(
        listener: (context, state) {
          if(state is LoadingStateSignIn){
            showDialog(
              context: context,
              builder: (context){
                return   const Center(child: CircularProgressIndicator(color:Colors.greenAccent,));
              },
            );
          }else if(state is SuccessStateSignIn){
            CashHelper.setDataMorePrivet(
                tokenValue: state.userCredential.user!.uid);
            AppConsts.uIdUser = state.userCredential.user!.uid;
            Fluttertoast.showToast(
                msg: "Logged in successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 18.sp
            );
            Navigator.pushNamedAndRemoveUntil(context, NameRout.homeLayOut,(route) => false);
          }else if(state is ErrorStateSignIn){
            Fluttertoast.showToast(
                msg: state.error.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 18.sp
            );
          }
        },
        builder: (context,state){
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(25.sp),
              child:  Form(
                key:SignInCubit.get(context).formKey ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h,),
                    SizedBox(height: 20.h,),
                    Center(
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Center(
                      child: Text(
                        'Sign in to your account',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 35.h,),
                    TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp
                      ),
                      keyboardType:TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'please enter email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.greenAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color:Colors.red, width: 1.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Theme.of(context).disabledColor, width: 1.w),
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color:Colors.red, width: 1.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    TextFormField(
                      obscureText: SignInCubit.get(context).isObscureText,
                      keyboardType:TextInputType.visiblePassword,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'please enter password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: (){
                          SignInCubit.get(context).changevalue();
                          },
                          child: Icon(
                            SignInCubit.get(context).isObscureText?Icons.visibility_off_outlined: Icons.visibility_outlined,
                            color: Colors.greenAccent,
                          ),
                        ),
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.greenAccent,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color:Colors.red, width: 1.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Theme.of(context).disabledColor, width: 1.w),
                        ),
                        focusedErrorBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color:Colors.red, width: 1.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    GestureDetector(
                      onTap: (){
                       if(SignInCubit.get(context).formKey.currentState!.validate()){
                         SignInCubit.get(context).logIn(email: emailController.text,
                             password: passwordController.text);
                       }
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.greenAccent,
                        ),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h,),
                    Row(
                      children: [
                        Text(
                          'Don\'t have an account ?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector (
                          onTap: (){
                            Navigator.pushNamed(context, NameRout.registerView);
                          },
                          child: Text(
                            ' Create account now',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
