import 'package:beatify/models/user_model.dart';
import 'package:beatify/widgets/animated_button.dart';
import 'package:beatify/widgets/custom_navbar_curved.dart';
import 'package:beatify/widgets/inputfield_widget.dart';
import 'package:beatify/widgets/neon_card.dart';
import 'package:beatify/widgets/password_inputfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var namecontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    Future<void> signupUser(String name, String email, String password) async {
      final pref = await SharedPreferences.getInstance();
      List<String> emails = pref.getStringList("emails") ?? [];
      List<String> passwords = pref.getStringList("passwords") ?? [];

      if (emails.contains(email)) {
        Get.snackbar(
          'Error',
          'You are already a user. Please Login',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 52, 26, 56),
          colorText: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          margin: const EdgeInsets.all(6),
          borderRadius: 12,
        );
        Get.back();
      } else {
        // Save email & password
        emails.add(email);
        passwords.add(password);
        await pref.setStringList("emails", emails);
        await pref.setStringList("passwords", passwords);

        UserModel.user = UserModel(name: name, email: email);

        Get.snackbar(
          'Success',
          'Signup successful. Welcome ${UserModel.user?.name}!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: const Color.fromARGB(255, 52, 26, 56),
          colorText: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          margin: const EdgeInsets.all(6),
          borderRadius: 12,
        );
        Get.off(() => const CustomNavBarCurved());
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
                  height: 460,
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
                            text: 'Name',
                            hint: 'Enter your name',
                            control: namecontroller,
                          ),
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

                          SizedBox(height: 16),
                          AnimatedButton(
                            text: 'SignUp',
                            action: () {
                              var name = namecontroller.text.trim();
                              var email = emailcontroller.text.trim();
                              var password = passwordcontroller.text.trim();
                              if (email.isNotEmpty && password.isNotEmpty) {
                                signupUser(name, email, password);
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Please enter all fields",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account ?",
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
                                  Get.back();
                                },
                                child: Text(
                                  "Login",
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
