import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/data.dart';

class Onboarding extends StatefulWidget {
  static const routeName = "Onboarding";

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
      backgroundColor: AppColors.lightBlack,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/Group 31 (1).png"),
            Expanded(
              child: PageView.builder(
                //physics: BouncingScrollPhysics(),
                controller: controller,
                itemCount: intro.length,
                onPageChanged: (index) {
                  setState(() {
                    isLast = index == intro.length - 1;
                    //this.currentIndex
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          intro[index].image,
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(height: 50),
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
                        // SizedBox(height: 40),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index == 0
                                ? SizedBox(width: 80)
                                : TextButton(
                                    onPressed: () {
                                      controller.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Text(
                                      "Back",
                                      style: AppStyles.goldBold20,
                                    ),
                                  ),
                            Spacer(),
                            Row(
                              children: [
                                SmoothPageIndicator(
                                  controller: controller,
                                  effect: ExpandingDotsEffect(
                                    dotColor: Colors.grey,
                                    activeDotColor: AppColors.gold,
                                    dotHeight: 10,
                                    expansionFactor: 4,
                                    dotWidth: 10,
                                    spacing: 5,
                                  ),
                                  count: intro.length,
                                ),
                              ],
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () async {
                                if (isLast) {
                                  final SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  await pref.setBool('done', true);
                                  if (context.mounted) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/login',
                                    );
                                  }
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
