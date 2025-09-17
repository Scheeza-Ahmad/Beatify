import 'package:beatify/screens/forget_password_screen.dart';
import 'package:beatify/screens/signup_screen.dart';
import 'package:beatify/widgets/animated_button.dart';
import 'package:beatify/widgets/custom_navbar_curved.dart';
import 'package:beatify/widgets/inputfield_widget.dart';
import 'package:beatify/widgets/neon_card.dart';
import 'package:beatify/widgets/password_inputfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beatify/models/user_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    Future<void> loginUser(String email, String password) async {
      final pref = await SharedPreferences.getInstance();
      List<String> emails = pref.getStringList("emails") ?? [];
      List<String> passwords = pref.getStringList("passwords") ?? [];

      if (emails.contains(email)) {
        int index = emails.indexOf(email);
        if (passwords[index] == password) {
          Get.snackbar(
            "Success",
            "Login successful!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: const Color.fromARGB(255, 52, 26, 56),
            colorText: Colors.white,
            borderColor: Colors.black,
            borderWidth: 2,
            margin: const EdgeInsets.all(6),
            borderRadius: 12,
          );
          Get.off(() => const CustomNavBarCurved());
        } else {
          Get.snackbar(
            "Error",
            "Wrong password!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: const Color.fromARGB(255, 52, 26, 56),
            colorText: Colors.white,
            borderColor: Colors.black,
            borderWidth: 2,
            margin: const EdgeInsets.all(6),
            borderRadius: 12,
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "No account found. Please signup first.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 52, 26, 56),
          colorText: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          margin: const EdgeInsets.all(6),
          borderRadius: 12,
        );
        Get.to(() => const SignupScreen());
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.black, Color(0xFF6A1B9A)],
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: NeonCard(
                child: Container(
                  width: 600,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15),

                          LabelAboveTextField(
                            text: 'Email',
                            hint: 'Enter your email',
                            control: emailcontroller,
                          ),
                          SizedBox(height: 15),
                          PasswordInput(
                            textEditingController: passwordcontroller,
                            hintText: 'Enter your Password',
                            text: 'Password',
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => ForgetPasswordScreen());
                                },
                                child: Text(
                                  'Forget Password',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      197,
                                      219,
                                      230,
                                    ),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          AnimatedButton(
                            text: 'Login',
                            action: () {
                              var name = emailcontroller.text.trim();
                              var password = passwordcontroller.text.trim();
                              if (name.isNotEmpty && password.isNotEmpty) {
                                loginUser(name, password);
                                UserModel.user = UserModel(
                                  name: name,
                                  email: 'abc@gmail.com',
                                );
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Please enter all fields",
                                );
                              }
                            },
                          ),
                          SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    165,
                                    198,
                                    214,
                                  ),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => SignupScreen());
                                },
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      165,
                                      198,
                                      214,
                                    ),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
