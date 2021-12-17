import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tst_new2/provider.dart';
import 'package:tst_new2/shared/endpoints/end.dart';
import 'modules/SplashScreen/splashanimation.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Model()..getproducts("")..getCategories(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        home:  AnimatedSplashScreen(
            duration: 3000,
            splashIconSize: 200,
            splash: Lottie.asset(Aniamtions.loadingpage),
            nextScreen: nextpage,
            splashTransition: SplashTransition.rotationTransition,
        ),
      ),
    );
  }
}
