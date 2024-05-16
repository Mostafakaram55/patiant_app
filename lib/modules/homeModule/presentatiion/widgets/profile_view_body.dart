
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patiant_app/modules/homeModule/presentatiion/view_model/profile_view_cubit.dart';
import 'package:patiant_app/modules/homeModule/presentatiion/view_model/profile_view_states.dart';

import '../../../AuthModule/data/model/user_model.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    BlocProvider(create: (context)=>ProfileCubit()..getUserData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProfileCubit,ProfileCubitStates>(
      builder: (context, state) {
        UserModel? model=ProfileCubit.get(context).userModel;
        return  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Image(
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTql7QO1cKJ2vGPissyg8P5dvN0F0fmajfgtEoaIywuRg&s'
                  ),
                ),
                SizedBox(height: 30.h,),
                TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp
                  ),
                  controller: ProfileCubit.get(context).email,
                  decoration: InputDecoration(
                    hintText: model!.email ,
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
                SizedBox(height: 20.h,),
                TextFormField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp
                  ),
                  keyboardType:TextInputType.emailAddress,
                  controller: ProfileCubit.get(context).phone,
                  decoration: InputDecoration(
                    hintText: model.phone,
                    prefixIcon: const Icon(
                      Icons.phone,
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
                SizedBox(height: 20.h,),
                TextFormField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp
                  ),

                  controller: ProfileCubit.get(context).address,
                  decoration: InputDecoration(
                    hintText: model.address,
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

              ],
            ),
          ),
        );
      },
    );
  }
}
