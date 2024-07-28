import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nactuz_flutter/login_signup_flow_pages/login_or_signup_option.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_routing/custom_transitions.dart';

class MyProfile extends ConsumerStatefulWidget {
  const MyProfile({super.key});

  @override
  ConsumerState<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends ConsumerState<MyProfile> {
  Future<void> handleLogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLoggedIn', false);

    // Check if the widget is still mounted before navigating
    if (mounted) {
      Navigator.of(context).push(CustomTransition(page: const LoginOrSignupOption()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: handleLogout,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 50,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: const Center(
              child: Text(
                'LOGOUT',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
