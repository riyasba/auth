import 'package:auth/firebase/firebase_auth_service.dart';
import 'package:auth/widgets/app_constant.dart';
import 'package:auth/widgets/controller/auth_controller.dart';
import 'package:auth/widgets/form.dart';
import 'package:auth/widgets/screens/auth/widget.dart';
import 'package:auth/widgets/screens/otp_generation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'LOGIN PAGE',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [ksizedbox30,
            Image.asset(
              'assets/WhatsApp Image 2024-03-04 at 14.25.35_f06b26a5.jpg',
              height: 250,
            ),
            Text(
              'Enter your Login Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            ksizedbox30,
            Text(
              'Login to your account with',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              'Email and Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            ksizedbox30,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                      autofocus: false,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(
                            60,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                          right: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.2,
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(
                            60,
                          ),
                        ),
                        filled: true,
                        hintStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                        hintText: "example@mail.com",
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email can't be empty";
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "Enter correct email";
                        }
                        return null;
                      },
                    ),
                    ksizedbox20,
                    Obx(
                      () => TextFormField(
                        controller: passwordController,
                        obscureText: controller.isHidden,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                            ),
                            child: IconButton(
                                onPressed: () {
                                       controller.togglePasswordView();
                                },
                                icon: controller.isHidden
                                    ? Icon(Icons.remove_red_eye)
                                    : Image.asset(
                                        'assets/hide_icon_184088.png',
                                        height: 30,
                                      )),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Colors.black,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(
                              60,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                            right: 25,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 1.2,
                              color: Colors.black,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(
                              60,
                            ),
                          ),
                          filled: true,
                          hintText: "••••••••••",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 104, 104, 104),
                              ),
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 4) {
                            return "Password must be of four characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    //     ksizedbox20w,
                  ],
                ),
              ),
            ),
            ksizedbox10,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: InkWell(
            //     onTap: () {
            //       //     Get.to(ForgotPasswordScreen());
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         Text(
            //           'Forgot Password',
            //           style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             decoration: TextDecoration.underline,
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            ksizedbox40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  CustomElevatedButton(
                        height: 40,
                        width: 1,
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                                AppConstant.showLoader(context: context);
 await saveCredentials(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );

                            _signUp();
                            //  _signUp();
                            // controller.loginUser(
                            //     username: emailController.text,
                            //     password: passwordController.text);
                          }
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: customtext(
                        text: 'SIGN IN',
                      ),
                      )
                  
              
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      Get.offAll(AuthGenerationScreen());
      AppConstant.showSnackbar(
        headText: "Successful",
        content: "Signing in...",
        position: SnackPosition.BOTTOM,
      );
    } else {
      Get.rawSnackbar(
        messageText: Text(
          'SignIn Failed',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
    }
  }




 Future<void> saveCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

}




  



class customtext extends StatelessWidget {
  const customtext({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: smalbalckfont.copyWith(
          fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
    );
  }
}

var smalbalckfont = GoogleFonts.montserrat(
  fontSize: 15,
);
