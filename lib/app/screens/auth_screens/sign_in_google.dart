import 'dart:developer';

import 'package:chatty/app/routes/route_paths.dart';
import 'package:chatty/app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Getx_helper/library.dart';

class SignInGoogle extends GetView<SignInController> {
  const SignInGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          'FlutterFire',
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          'Authentication',
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await controller.handleSignIn();
                      if(UserStore.to.hasToken){
                        log('Hello');
                        Get.offAndToNamed(RoutePaths.homePage);
                      }else{
                        log('Not here again');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              'Sign in with Google',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])
        ),
      ),
    );
  }
}
