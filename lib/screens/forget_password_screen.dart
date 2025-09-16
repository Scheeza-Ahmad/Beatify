import 'package:beatify/screens/login_screen.dart';
import 'package:beatify/widgets/animated_button.dart';
import 'package:beatify/widgets/inputfield_widget.dart';
import 'package:beatify/widgets/neon_card.dart';
import 'package:beatify/widgets/password_inputfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var confirmpasswordcontroller = TextEditingController();
    Future<void> resetPassword(String email, String newPassword) async {
      final pref = await SharedPreferences.getInstance();
      List<String> emails = pref.getStringList("emails") ?? [];
      List<String> passwords = pref.getStringList("passwords") ?? [];

      if (emails.contains(email)) {
        int index = emails.indexOf(email);
        passwords[index] = newPassword;
        await pref.setStringList("passwords", passwords);

        Get.snackbar(
          "Success",
          "Password updated successfully!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 52, 26, 56),
          colorText: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          margin: const EdgeInsets.all(6),
          borderRadius: 12,
        );
        Get.off(() => const LoginScreen());
      } else {
        Get.snackbar(
          "Error",
          "No account found with this name.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 52, 26, 56),
          colorText: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          margin: const EdgeInsets.all(6),
          borderRadius: 12,
        );
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
                          PasswordInput(
                            textEditingController: confirmpasswordcontroller,
                            hintText: 'Confirm Password',
                            text: 'Confirm Password',
                          ),

                          SizedBox(height: 16),
                          AnimatedButton(
                            text: 'Register',
                            action: () {
                              String name = emailcontroller.text.trim();
                              String newPass = passwordcontroller.text.trim();
                              String confirmPass = confirmpasswordcontroller
                                  .text
                                  .trim();
                              if (name.isNotEmpty &&
                                  newPass.isNotEmpty &&
                                  confirmPass.isNotEmpty) {
                                resetPassword(name, newPass);
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Please fill all fields",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    52,
                                    26,
                                    56,
                                  ),
                                  colorText: Colors.white,
                                  borderColor: Colors.black,
                                  borderWidth: 2,
                                  margin: const EdgeInsets.all(6),
                                  borderRadius: 12,
                                );
                              }
                            },
                          ),
                          SizedBox(height: 14),
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
