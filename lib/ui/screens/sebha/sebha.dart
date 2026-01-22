import 'dart:math' as math show pi;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double angle = 0;

  int count = 0;

  List<String> zkar = [
    "الحمدلله",
    "لا اله الا الله ",
    " الله اكبر",
    "سبحان الله ",
  ];
  int azkarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sebha_bg.png"),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                AppColors.lightBlack.withOpacity(0.8),
                BlendMode.darken,
              ),
            ),
          ),
       child:  SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group 31 (1).png"),
              SizedBox(height: 10),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: AppStyles.whiteBold20,
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8,
                      ),
                      child: GestureDetector(
                        onTap: onClick,
                        child: Transform.rotate(
                          angle: angle,
                          child: Image.asset(
                            "assets/images/SebhaBody 1.png",
                            height: 450,
                          ),
                        ),
                      ),
                    ),
                    Image.asset("assets/images/Group 37.png", height: 60),
                    Positioned(
                      bottom: 250,
                      child: Text(
                        zkar[azkarIndex],
                        style: AppStyles.whiteBold20,
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      child: Text("$count", style: AppStyles.whiteBold20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  void onClick() {
    setState(() {
      count++;
      angle += (360 / 33) * (math.pi / 180);
      //angle -= pi/24 ;
      if (count == 33) {
        count = 0;
        azkarIndex = (azkarIndex + 1) % zkar.length;
      }
    });
  }
}
