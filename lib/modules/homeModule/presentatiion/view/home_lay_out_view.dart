
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patiant_app/core/rout_manager.dart';

import '../../../../core/network/cach.dart';
import '../../../../core/network/funcation_yrl.dart';
import '../view_model/profile_view_cubit.dart';

class HomeLayOutView extends StatefulWidget {
  const HomeLayOutView({super.key});

  @override
  State<HomeLayOutView> createState() => _HomeLayOutViewState();
}

class _HomeLayOutViewState extends State<HomeLayOutView> {
  @override
  void initState() {
    ProfileCubit.get(context).getUserData();
    super.initState();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            _scaffoldKey.currentState!.openDrawer();
          },
          icon:  Icon(
            Icons.menu,
            color: Colors.black,
            size: 25.sp,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: Container(
        width: 250.w,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp
                  ),
                ),
                 onTap: (){
                  Navigator.pushNamed(context,NameRout.profileview);
                 },
              ),
              SizedBox(height: 20.h,),
              ListTile(
                leading: const Icon(
                    Icons.login_outlined
                ),
                title: Text(
                  'LogOut',
                   style: TextStyle(
                  color: Colors.black,
                   fontSize: 20.sp),),
                onTap: (){
                  CashHelper.deleteData().then((value) {
                    Navigator.pushNamedAndRemoveUntil(context, NameRout.logInView, (route) => false);
                  });
                },
              ),
              SizedBox(height: 20.h,),
              ListTile(
                leading: const Icon(
                    Icons.message
                ),
                title: Text(
                  'Message',
                   style: TextStyle(
                  color: Colors.black,
                   fontSize: 20.sp),),
                onTap: (){
                  openLink('https://wa.me/+20${context.read<ProfileCubit>().userModel!.phone}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
