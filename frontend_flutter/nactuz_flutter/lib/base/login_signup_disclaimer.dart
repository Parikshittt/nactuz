import 'package:flutter/cupertino.dart';

import '../styles/app_styles.dart';

class LoginSignupDisclaimer extends StatelessWidget {
  const LoginSignupDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'By creating an account, I accept the ',
              style: AppStyles.twelveRegularMain,
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms & Conditions',
                  style: AppStyles.twelveBoldMain,
                ),
              ],
            ),
          ),
        ),
        const Center(child: Text('Version 1.0.0')),
      ],
    );
  }
}
