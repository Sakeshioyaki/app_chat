import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/ui/pages/sign_in/input_name/input_name_page.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class InputCodePage extends StatefulWidget {
  const InputCodePage({Key? key}) : super(key: key);

  @override
  State<InputCodePage> createState() => _InputCodePageState();
}

class _InputCodePageState extends State<InputCodePage> {
  TextEditingController textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop;
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 12,
          ),
        ),
        shadowColor: Colors.transparent,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              color: Colors.transparent,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // reverse: true,
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Code',
                style: AppTextStyle.blackS24Bold,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 295,
                child: Text(
                  "Please confirm your country code and enter your phone number",
                  style: AppTextStyle.blackS14,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    blinkWhenObscuring: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      borderWidth: 1.5,
                      activeFillColor: Colors.transparent,
                      activeColor: Colors.transparent,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      inactiveFillColor: Colors.grey,
                      fieldOuterPadding: EdgeInsets.zero,
                    ),
                    textStyle: const TextStyle(fontSize: 30),
                    cursorColor: Colors.black,
                    cursorHeight: 20,
                    animationDuration: const Duration(milliseconds: 200),
                    enableActiveFill: true,
                    controller: textCtrl,
                    autoDisposeControllers: false,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print(value);
                    },
                    onCompleted: (String value) {
                      print("this is ${value}");
                      Get.to(() => ProfilePage());
                    }),
              ),
              const SizedBox(height: 60),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  style: AppTextStyle.blueS16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
