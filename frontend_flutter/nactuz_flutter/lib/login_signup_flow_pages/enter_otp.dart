import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';
import 'package:nactuz_flutter/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EnterOtp extends ConsumerStatefulWidget {
  const EnterOtp({super.key});

  @override
  ConsumerState<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends ConsumerState<EnterOtp> {
  Timer? _timer; // Use nullable Timer
  int _seconds = 30;
  bool _canResend = false;
  bool _isButtonEnabled = false;
  String _otpInputByUser = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Cancel any existing timer
    _timer?.cancel();

    _seconds = 30;
    _canResend = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  void _handleResendOtp() {
    if (_canResend) {
      _startTimer(); // Start or restart the timer
      // Add your OTP resend logic here
    }
  }

  Future<void> _handleSubmitOTP() async {
    if (_otpInputByUser == '110401') {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'isUserLoggedIn', value: 'true');
      bool isStudent = await storage.read(key: 'isStudent') == 'true';

      // Check if the widget is still mounted before navigating
      if (mounted) {
        isStudent ? context.go('/studentHomePage') : context.go('/teacherHomePage');
      }
    } else {
      // Handle the case where OTP is incorrect
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer if it's not null
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = ref.read(studentPhoneNumber);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 48, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'VERIFY YOUR NUMBER',
              style: AppStyles.sixteenBoldMain,
            ),
            Text(
              'OTP sent to $phoneNumber',
              style: AppStyles.twelveRegularSecond,
            ),
            const SizedBox(height: 30),
            const Text(
              'Enter OTP',
              style: AppStyles.twelveRegularSecond,
            ),
            Center(
              child: Pinput(
                onCompleted: (otpInput) {
                  setState(() {
                    _otpInputByUser = otpInput;
                    _isButtonEnabled = otpInput.length == 6;
                  });
                },
                onChanged: (otpInput) {
                  setState(() {
                    _isButtonEnabled = otpInput.length == 6;
                    _otpInputByUser = otpInput;
                  });
                },
                length: 6,
                focusedPinTheme: const PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: AppStyles.sixteenBoldMain,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppStyles.brandColor,
                        width: 3.0, // Set the width of the bottom border
                      ),
                    ),
                  ),
                ),
                defaultPinTheme: const PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: AppStyles.sixteenBoldMain,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppStyles.brandColor,
                        width: 1.0, // Set the width of the bottom border
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: _handleResendOtp,
              child: Text(
                _canResend
                    ? 'Re-send'
                    : 'Didn\'t receive OTP? Re-send in $_seconds seconds',
                style: _canResend
                    ? AppStyles.twelveBoldMain
                    : AppStyles.twelveRegularSecond,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: _isButtonEnabled ? _handleSubmitOTP : null,
              child: Container(
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _isButtonEnabled ? AppStyles.brandColor : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'ENTER OTP',
                  style: AppStyles.filledButtonText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
