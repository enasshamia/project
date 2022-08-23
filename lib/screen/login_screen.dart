import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/screen/register_screen.dart';
import 'package:project/style.dart';
import 'package:project/widget/custom_button.dart';
import 'package:project/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: SingleChildScrollView(
      child: Consumer<AppProvider>(builder: (context, provider, x) {
        return SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Form(
                    key: provider.loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        Row(children: [
                          Image.asset("assets/hello.png"),
                          Text("   !مرحبا    ",
                              style: GoogleFonts.tajawal(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                        ]),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 35),
                          child: Text("رائع ، قم  بتسجيل الدخول",
                              style: GoogleFonts.tajawal(
                                fontSize: 16,
                              )),
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        CustomTextfeild(
                          fun3: (e) {},
                          fun: provider.validateEmail,
                          label: "البريد الالكتروني ",
                          controller: provider.emailController,
                          icon: const Icon(
                            CupertinoIcons.mail,
                            size: 18,
                            color: Color.fromRGBO(117, 117, 117, 1),
                          ),
                        ),
                        CustomTextfeild(
                          fun3: (e) {},

                          // textInputType: TextInputType.number,

                          fun: provider.validatePassword,
                          label: "كلمة المرور ",
                          controller: provider.passwordController,
                          icon: const Icon(
                            CupertinoIcons.lock,
                            size: 17,
                            color: Color.fromRGBO(117, 117, 117, 1),
                          ),
                        ),
                        CustomButton(
                          title: "تسجيل الدخول ",
                          function: () {
                            provider.login(context);
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'لا تمتلك حساب ؟',
                              style: GoogleFonts.tajawal(
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              child: Text('سجل الآن',
                                  style: GoogleFonts.tajawal(
                                      fontSize: 14, color: primaryColor)),
                              onPressed: () {
                                Get.to(() => UserRegister());
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
        );
      }),
    ));
  }
}
