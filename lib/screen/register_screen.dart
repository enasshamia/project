// import 'package:delivery_food/user/view/register_map_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/provider/app_provider.dart';
import 'package:project/screen/login_screen.dart';
import 'package:project/style.dart';
import 'package:project/widget/custom_button.dart';
import 'package:provider/provider.dart';

import '../widget/custom_text_field.dart';

class UserRegister extends StatelessWidget {
  // UserType type;
  // UserRegister(this.type, {Key key}) : super(key: key);
  GlobalKey<FormState> registerUser = GlobalKey<FormState>();
  // static AuthViewModel authViewModel = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(""),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<AppProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                ),
                child: Form(
                    key: registerUser,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        Text("مرحبا!",
                            style: GoogleFonts.tajawal(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text("يرجى ملء هذه التفاصيل",
                            style: GoogleFonts.tajawal(
                              fontSize: 16,
                            )),
                        CustomTextfeild(
                          fun3: (e) {},
                          label: "اسم المستخدم",
                          controller: provider.userNameController,
                          fun: provider.nullValidate,
                          icon: const Icon(
                            Icons.person,
                            size: 18,
                            color: Color.fromRGBO(117, 117, 117, 1),
                          ),
                        ),
                        CustomTextfeild(
                          fun3: (e) {},
                          label: "البريد الالكتروني ",
                          controller: provider.emailController,
                          fun: provider.validateEmail,
                          icon: const Icon(
                            Icons.email,
                            size: 18,
                            color: Color.fromRGBO(117, 117, 117, 1),
                          ),
                        ),
                        CustomTextfeild(
                          fun3: (e) {},
                          label: "كلمة المرور ",
                          controller: provider.passwordController,
                          isHidden: true,
                          fun: provider.validatePassword,
                          icon: const Icon(
                            Icons.password,
                            size: 18,
                            color: Color.fromRGBO(117, 117, 117, 1),
                          ),
                        ),
                        CustomTextfeild(
                          fun3: (e) {},
                          label: " رقم التلفون  ",
                          fun: provider.nullValidate2,
                          controller: provider.phoneController,
                          textInputType: TextInputType.phone,
                          icon: const Icon(
                            Icons.phone,
                            size: 18,
                            color: Color.fromRGBO(117, 117, 117, 1),
                          ),
                        ),
                        CustomTextfeild(
                          fun3: (e) {},
                          label: "  العنوان  ",
                          fun: provider.nullValidate,
                          controller: provider.addressControlller,
                          textInputType: TextInputType.text,
                          icon: const Icon(
                            Icons.location_city,
                            size: 18,
                            color: Color.fromRGBO(117, 117, 117, 1),
                          ),
                        ),
                        CustomTextfeild(
                          fun3: (e) {},
                          label: "  الطول  ",
                          fun: provider.nullValidate,
                          controller: provider.heightControlller,
                          textInputType: TextInputType.number,
                        ),
                        CustomTextfeild(
                          fun3: (e) {},
                          label: "  العرض  ",
                          fun: provider.nullValidate,
                          controller: provider.widthControlller,
                          textInputType: TextInputType.number,
                        ),
                        CustomButton(
                          title: "سجل الان ",
                          function: () {
                            if (registerUser.currentState.validate()) {
                              provider.registerNewUser(context, null);
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '  هل لديك حساب ؟',
                              style: GoogleFonts.tajawal(
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                ' تسجيل الدخول',
                                style: GoogleFonts.tajawal(
                                  color: primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => const LoginScreen());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
            ),
          );
        }),
      ),
    );
  }
}
