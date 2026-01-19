import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/data.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController();

  // final int index = 0;

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: controller,
                itemCount: intro.length,
                onPageChanged: (index) => setState(() {
                  isLast = index == intro.length - 1;
                }),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Image.asset(intro[index].image, width: 398, height: 415),
                      SizedBox(height: 30),
                      Text(
                        intro[index].title,
                        textAlign: TextAlign.center,
                        style: AppStyles.goldBold20,
                      ),
                      SizedBox(height: 20),
                      Text(
                        intro[index].subTitle,
                        textAlign: TextAlign.center,
                        style: AppStyles.goldBold20,
                      ),
                      SizedBox(height: 20),

                      Row(
                        children: [
                          SmoothPageIndicator(
                            controller: controller,
                            effect: ExpandingDotsEffect(
                              dotColor: Colors.black26,
                              activeDotColor: AppColors.gold,
                              dotHeight: 10,
                              expansionFactor: 4,
                              dotWidth: 10,
                              spacing: 5,
                            ),
                            count: intro.length,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  controller.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Text("Back", style: AppStyles.goldBold20),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (isLast) {
                                  } else {
                                    controller.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Text("Next", style: AppStyles.goldBold20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
