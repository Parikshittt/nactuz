import 'package:nactuz_flutter/styles/app_styles.dart';
import 'package:flutter/material.dart';
import '../base/login_signup_disclaimer.dart';
import '../custom_routing/custom_transitions.dart';
import 'login_screen.dart'; // Import your login screen
import 'signup_screen.dart'; // Import your signup screen

class LoginOrSignupOption extends StatelessWidget {
  const LoginOrSignupOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppStyles.cardBackgroundColor,
            boxShadow: [
              BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 20)
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
                      Text('Hey There', style: AppStyles.sixteenBoldMain),
                      Text('Login/SignUp to cruise through the competition', style: AppStyles.twelveRegularSecond),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(CustomTransition(page: const LoginScreen())),
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppStyles.brandColor,
                          ),
                          child: const Text('LOGIN', style: AppStyles.filledButtonText),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15), // Space between the two buttons
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(CustomTransition(page: const SignupScreen())),
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppStyles.brandColor,
                              width: 2.0, // Optional: specify the width of the border
                            ),
                          ),
                          child: const Text('SIGNUP', style: AppStyles.outlineButtonText),
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
    );
  }
}
