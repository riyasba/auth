import 'package:auth/widgets/form.dart';
import 'package:auth/widgets/screens/auth/signin.dart';
import 'package:auth/widgets/screens/otp_generation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    toHomePage();
  }

  toHomePage() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is already authenticated, navigate to the home page
       Get.offAll(AuthGenerationScreen());
      
    } else {
      // User is not authenticated, navigate to the authentication page
     Get.offAll(LoginScreen());
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/WhatsApp Image 2024-03-04 at 14.25.35_f06b26a5.jpg'),
         ksizedbox30,Text('Loading...',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black),)     ],
        ),
      ),
    );
  }
}
