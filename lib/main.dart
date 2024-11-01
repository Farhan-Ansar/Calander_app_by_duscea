import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:duseca_calender_app/utils/routes/routes.dart';
import 'package:duseca_calender_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart'; // Import the provider

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: kColorGreyTextColor,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Duseca Calendar App',
          initialRoute: RoutesName.homeScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
