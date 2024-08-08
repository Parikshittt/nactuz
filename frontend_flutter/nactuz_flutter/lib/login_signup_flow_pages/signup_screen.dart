import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nactuz_flutter/provider.dart';
import '../base/login_signup_disclaimer.dart';
import '../styles/app_styles.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  bool _isButtonEnabled = false;
  bool isTeacherSelected = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers
    _mobileNumberController.addListener(enableDisableSendOtpButton);
    _firstNameController.addListener(enableDisableSendOtpButton);
    _lastNameController.addListener(enableDisableSendOtpButton);

    // Set initial mobile number from Riverpod
    String numberOfStudent = ref.read(studentPhoneNumber);
    _mobileNumberController.text = numberOfStudent;
  }

  @override
  void dispose() {
    // Remove listeners and dispose controllers
    _mobileNumberController.removeListener(enableDisableSendOtpButton);
    _firstNameController.removeListener(enableDisableSendOtpButton);
    _lastNameController.removeListener(enableDisableSendOtpButton);
    _mobileNumberController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void enableDisableSendOtpButton() {
    final mobileNumber = _mobileNumberController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;

    setState(() {
      if (isTeacherSelected) {
        _isButtonEnabled = mobileNumber.isNotEmpty &&
            firstName.isNotEmpty &&
            lastName.isNotEmpty &&
            mobileNumber.length == 12;
      } else {
        _isButtonEnabled = mobileNumber.isNotEmpty &&
            firstName.isNotEmpty &&
            lastName.isNotEmpty &&
            mobileNumber.length == 10;
      }
    });
  }

  Future<void> _setUserType(bool value) async {
    await _secureStorage.write(key: 'isStudent', value: (!value).toString()); // Setting opposite of value
  }

  void handleSignUpScreenSendOTP() {
    final phoneNumber = _mobileNumberController.text;
    ref.read(studentPhoneNumber.notifier).state = phoneNumber;
    context.push('/enterotp');
  }

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTeacherSelected = false;
                              _mobileNumberController.text = '';
                            });
                            _setUserType(isTeacherSelected);
                            enableDisableSendOtpButton();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: isTeacherSelected
                                    ? AppStyles.cardBackgroundColor
                                    : AppStyles.brandColor,
                                boxShadow: const [
                                  BoxShadow(color: Colors.black, blurRadius: 20)
                                ]),
                            height: 50,
                            alignment: Alignment.center,
                            child: Text('Student',
                                style: isTeacherSelected
                                    ? AppStyles.outlineButtonText
                                    : AppStyles.filledButtonText),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTeacherSelected = true;
                              _mobileNumberController.text = '';
                            });
                            _setUserType(isTeacherSelected);
                            enableDisableSendOtpButton();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: isTeacherSelected
                                    ? AppStyles.brandColor
                                    : AppStyles.cardBackgroundColor,
                                boxShadow: const [
                                  BoxShadow(color: Colors.black, blurRadius: 20)
                                ]),
                            height: 50,
                            alignment: Alignment.center,
                            child: Text('Teacher',
                                style: isTeacherSelected
                                    ? AppStyles.filledButtonText
                                    : AppStyles.outlineButtonText),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'First Name',
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
                    child: TextField(
                      controller: _firstNameController,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                        LengthLimitingTextInputFormatter(30),
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Last Name',
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
                    child: TextField(
                      controller: _lastNameController,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                        LengthLimitingTextInputFormatter(30),
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (isTeacherSelected)
                    const Text(
                      'Your Adhaar Number',
                      style: AppStyles.twelveRegularSecond,
                    )
                  else
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
                        if (!isTeacherSelected)
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
                              LengthLimitingTextInputFormatter(
                                  isTeacherSelected ? 12 : 10),
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
                  const LoginSignupDisclaimer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
