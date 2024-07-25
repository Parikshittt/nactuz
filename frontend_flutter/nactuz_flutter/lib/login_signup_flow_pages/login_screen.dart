import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nactuz_flutter/base/login_signup_disclaimer.dart';
import 'package:nactuz_flutter/login_signup_flow_pages/signup_screen.dart';
import 'package:nactuz_flutter/provider.dart';
import '../custom_routing/custom_transitions.dart';
import '../styles/app_styles.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Add listener to the TextEditingController to update button state
    _mobileNumberController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    // Dispose of the controller to prevent memory leaks
    _mobileNumberController.removeListener(_updateButtonState);
    _mobileNumberController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    final mobileNumberLength = _mobileNumberController.text.length;
    print('Mobile number length: $mobileNumberLength'); // Debugging line
    setState(() {
      _isButtonEnabled = mobileNumberLength == 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    void handleLoginScreenSendOTP() {
      final enteredNumber = _mobileNumberController.text;

      if (enteredNumber == '7837615955') {
        // This block will execute if the number matches a specific value
        print('Go to OTP screen');

        // Assuming you want to set the value in the provider
        ref.read(studentPhoneNumber.notifier).state = enteredNumber;
        String updatedNumber = ref.watch(studentPhoneNumber);
        print('$updatedNumber');
      } else {
        // This block will execute if the number does not match the specific value
        ref.read(studentPhoneNumber.notifier).state = enteredNumber;
        String updatedNumber = ref.watch(studentPhoneNumber);
        print('Go to signup screen -> $updatedNumber');

        Navigator.of(context).push(CustomTransition(page: const SignupScreen()));
      }
    }



    return Scaffold(
      body: Scaffold(
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
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome Back!',
                            style: AppStyles.sixteenBoldMain,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'We missed you a lot ',
                              style: AppStyles.twelveRegularSecond,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '<3',
                                  style: AppStyles.twelveRegularBrand,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
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
                                ? handleLoginScreenSendOTP
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
      ),
    );
  }
}
