import 'package:assignment/core/utils/theme/theme.dart';
import 'package:assignment/init_dependencies.dart';
import 'package:assignment/splash_screen.dart';
import 'package:assignment/src/authentication/presentaion/bloc/auth_bloc.dart';
import 'package:assignment/src/onboarding/presentaion/cubit/onboarding_cubit.dart';
import 'package:assignment/src/user/presentation/bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => OnboardingCubit(),
      ),
      BlocProvider(
        create: (context) => sl<AuthBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<UserBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
