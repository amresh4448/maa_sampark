import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maa_samprak/app/app_data/component/button.dart';
import 'package:maa_samprak/app/app_data/component/textfiled.dart';
import 'package:maa_samprak/app/screen/verify_otp.dart';
import 'package:maa_samprak/app/utils/colors.dart';
import '../controller/login_ctrl.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});
 final loginCtrl = Get.put(LoginCtrl());
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/maa_samprak.png",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: loginCtrl.emailEditCtrl.value,
              labelText: 'Enter your Mobile No.',
              hintText: 'phone.',
              keyboardType: TextInputType.phone,
              prefixIcon: Icons.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),

            const SizedBox(
              height: 50,
            ),
            CustomButton(
              color: AppColors.success,
              text: 'login'.toUpperCase(),
              onPressed: () {
                Get.to(VerifyOtp());
        // if (formKey.currentState!.validate()) {
        //  loginCtrl.login();
        //  }

              },
            ),

          ],
        )),
      ),
    );
  }
}
