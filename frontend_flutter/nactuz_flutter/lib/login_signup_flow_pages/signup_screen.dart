import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nactuz_flutter/provider.dart';
import '../base/login_signup_disclaimer.dart';
import '../styles/app_styles.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({
    super.key,
  });

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isButtonEnabled = false;

  handleSignUpScreenSendOTP() {} //TODO

  @override
  Widget build(BuildContext context) {
    String numberOfStudent = ref.watch(studentPhoneNumber);
    _mobileNumberController.text = numberOfStudent;
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppStyles.cardBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome To Nactuz!',
                          style: AppStyles.sixteenBoldMain,
                        ),
                        Text(
                          'We are thrilled to have you on board.',
                          style: AppStyles.twelveRegularSecond,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Your name',
                    style: AppStyles.twelveRegularSecond,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppStyles.brandColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Expanded(
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                          LengthLimitingTextInputFormatter(30),
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Text(
                    'Choose your locality ( or nearest )',
                    style: AppStyles.twelveRegularSecond,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppStyles.brandColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const InkWell(
                          child: Text(
                            '? Gurgaon',
                            style: AppStyles.sixteenBoldSecond,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Text(
                    '10 digit phone number',
                    style: AppStyles.twelveRegularSecond,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppStyles.brandColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          '+91',
                          style: AppStyles.sixteenBoldSecond,
                        ),
                        const SizedBox(width: 5.0),
                        Expanded(
                          child: TextField(
                            controller: _mobileNumberController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: _isButtonEnabled
                              ? handleSignUpScreenSendOTP
                              : null,
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: _isButtonEnabled
                                  ? AppStyles.brandColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              'SEND OTP',
                              style: AppStyles.filledButtonText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const LoginSignupDisclaimer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
