import 'package:flutter/material.dart';
import 'package:islami/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami/ui/screens/main/main.dart';
import 'package:islami/ui/screens/onboarding/onboarding.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

 void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
   //SharedPreferences pref = await SharedPreferences.getInstance();
   //bool isOnboardingDone = pref.getBool(Constants.onboarding) ?? false;

   runApp(MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Onboarding(),
      // theme: ThemeData(canvasColor: AppColors.gold),
      routes: {
        Splash.routeName: (_) => Splash(),
        Onboarding.routeName:(_)=> Onboarding(),
        Main.routeName: (_) => Main(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
     // initialRoute: isOnboardingDone ? Main.routeName : Splash.routeName,
     // initialRoute: pref.getBool(Constants.onboarding)==true?Main.routeName:Onboarding.routeName ,
      initialRoute: Splash.routeName,
    );
  }
}

///Extensions in dart???
