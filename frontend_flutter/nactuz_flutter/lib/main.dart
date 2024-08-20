import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nactuz_flutter/login_signup_flow_pages/enter_otp.dart';
import 'package:nactuz_flutter/login_signup_flow_pages/login_or_signup_option.dart';
import 'package:nactuz_flutter/login_signup_flow_pages/login_screen.dart';
import 'package:nactuz_flutter/login_signup_flow_pages/signup_screen.dart';
import 'package:nactuz_flutter/student_pages/home_page.dart';
import 'package:nactuz_flutter/student_pages/mock_tests.dart';
import 'package:nactuz_flutter/styles/app_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nactuz_flutter/teacher_side_app/teacher_pages/teacher_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  String? userLoggedIn = await secureStorage.read(key: 'isUserLoggedIn');
  String? isStudent = await secureStorage.read(key: 'isStudent');
  runApp(ProviderScope(
      child: MyApp(
          secureStorage: secureStorage,
          userLoggedIn: userLoggedIn,
          isStudent: isStudent)));
}

class MyApp extends StatelessWidget {
  final FlutterSecureStorage secureStorage;
  final String? userLoggedIn;
  final String? isStudent;

  const MyApp(
      {super.key,
      required this.secureStorage,
      this.userLoggedIn,
      this.isStudent});

  @override
  Widget build(BuildContext context) {
    String initialRoute;

    if (userLoggedIn == 'true') {
      initialRoute =
          isStudent == 'true' ? '/studentHomePage' : '/teacherHomePage';
    } else {
      initialRoute = '/loginSignUpOption';
    }

    final GoRouter router = GoRouter(
      initialLocation: initialRoute,
      routes: [
        GoRoute(
          path: '/loginSignUpOption',
          builder: (context, state) => const LoginOrSignupOption(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: '/enterotp',
          builder: (context, state) => const EnterOtp(),
        ),
        GoRoute(
          path: '/studentHomePage',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/mockTests',
          builder: (context, state) => const MockTests(),
        ),
        GoRoute(
          path: '/teacherHomePage',
          builder: (context, state) => const TeacherHomePage(),
        ),
      ],
      errorBuilder: (context, state) => const Scaffold(
        body: Center(child: Text('Page not found')),
      ),
    );

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppStyles.mainBackgroundColor,
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppStyles.mainBackgroundColor,
          labelTextStyle: WidgetStateProperty.all(
            AppStyles.twelveBoldMain,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF121212),
        ),
        inputDecorationTheme: const InputDecorationTheme(),
      ),
    );
  }
}
