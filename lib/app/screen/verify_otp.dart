import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maa_samprak/app/utils/colors.dart';
import 'package:pinput/pinput.dart';

import '../app_data/component/button.dart';
import 'home_page.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/maa_samprak.png",
            ),
            const SizedBox(
              height: 20,
            ),
            Pinput(
              errorText: "Please enter OTP",
              errorTextStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.error,
              ),
              textInputAction: TextInputAction.done,
              mainAxisAlignment: MainAxisAlignment.center,
              disabledPinTheme: PinTheme(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: AppColors.success,
                ),
                padding: EdgeInsets.only(left: 9, right: 9),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.success),
                ),
              ),
             // controller: controller.otpController.value,
              length: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid code";
                }
                return null;
              },
              errorPinTheme: PinTheme(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.error),
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  color: AppColors.error,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                width: 60,
                height: 60,
              ),
              defaultPinTheme: PinTheme(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                width: 60,
                height: 60,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: AppColors.success,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color:AppColors.success,),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const  SizedBox(
              height: 8,
            ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: (){},
              child: Text("Re-send Otp".toUpperCase(),
                style: const TextStyle(color: AppColors.success),)),
        ),

        const  SizedBox(
        height: 50,
      ),
      CustomButton(
        color: AppColors.success,
        text: 'Verify Otp'.toUpperCase(),
        onPressed: () {
          Get.to(HomePage());

        },
      ),



          ],
        ),
      ),
    );
  }
}
