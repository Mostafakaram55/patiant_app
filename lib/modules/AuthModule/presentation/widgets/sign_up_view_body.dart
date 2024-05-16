
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../../../core/network/app_const.dart';
import '../../../../core/network/cach.dart';
import '../../../../core/rout_manager.dart';
import '../view_model/sign_up_cubit.dart';
import '../view_model/sign_up_states.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}
bool isObscureText=true;
bool isObscureTextC=true;
class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: BlocConsumer<SignUpCubit,SignUpStates>(
        listener: (context,state){
          if(state is SuccessStateSignUpStates){
            CashHelper.setDataMorePrivet(
                tokenValue: state.userCredential.user!.uid);
            AppConsts.uIdUser = state.userCredential.user!.uid;
            print(AppConsts.uIdUser);
            Fluttertoast.showToast(
                msg: "Logged in successfully",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 18.sp
            );
            Navigator.pushNamedAndRemoveUntil(context, NameRout.homeLayOut,(route) => false);
          }else if(state is LoadingStateSSignUpStates){
            showDialog(
              context: context,
              builder: (context){
                return  const Center(child: CircularProgressIndicator());
              },
            );
          }else{
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child:  Center(
                    child: Text(
                      'Cansel',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20.sp,
                      ),
                    )
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: SignUpCubit.get(context).formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp
                    ),
                    keyboardType:TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter userName';
                      }
                      return null;
                    },
                    controller: SignUpCubit.get(context).userNameController,
                    decoration: InputDecoration(
                      hintText: 'UserName',
                      prefixIcon: const Icon(
                        Icons.person,
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
                  SizedBox(height: 10.h,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp
                    ),
                    keyboardType:TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter email';
                      }
                      return null;
                    },
                    controller: SignUpCubit.get(context).emailRegisterController,
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
                  SizedBox(height: 10.h,),
                  TextFormField(

                    obscureText: isObscureText,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp
                    ),
                    keyboardType:TextInputType.visiblePassword,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter password';
                      }
                      return null;
                    },
                    controller: SignUpCubit.get(context).passwordRegisterController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            isObscureText=!isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText?Icons.visibility_off_outlined: Icons.visibility_outlined,
                          color:Colors.greenAccent,
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
                  SizedBox(height: 10.h,),
                  TextFormField(
                    obscureText: isObscureTextC,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp
                    ),
                    keyboardType:TextInputType.visiblePassword,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter Confirm Password';
                      }
                      return null;
                    },
                    controller: SignUpCubit.get(context).confiramPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            isObscureTextC=!isObscureTextC;
                          });
                        },
                        child: Icon(
                          isObscureTextC?Icons.visibility_off_outlined: Icons.visibility_outlined,
                          color: Colors.greenAccent,
                        ),
                      ),
                      hintText: 'Confirm Password',
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
                  SizedBox(height: 10.h,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp
                    ),
                    keyboardType:TextInputType.phone,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter phone';
                      }
                      return null;
                    },
                    controller: SignUpCubit.get(context).phoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      prefixIcon: const Icon(
                        Icons.call,
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
                  SizedBox(height: 10.h,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp
                    ),
                    keyboardType:TextInputType.streetAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter address';
                      }
                      return null;
                    },
                    controller: SignUpCubit.get(context).addressController,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      prefixIcon: const Icon(
                        Icons.location_on_rounded,
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
                  GestureDetector(
                    onTap: (){
                      if(SignUpCubit.get(context).formKey.currentState!.validate()){
                        SignUpCubit.get(context).register(
                            email:SignUpCubit.get(context).emailRegisterController.text ,
                            password: SignUpCubit.get(context).passwordRegisterController.text
                        );
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
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
