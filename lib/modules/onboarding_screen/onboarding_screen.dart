import 'package:algoriza_internship/modules/login/login_screen.dart';
import 'package:algoriza_internship/modules/onboarding_screen/onboarding_models.dart';
import 'package:algoriza_internship/modules/register/register_screen.dart';
import 'package:algoriza_internship/shared/component/default_button.dart';
import 'package:algoriza_internship/shared/component/default_text_button.dart';
import 'package:algoriza_internship/shared/component/navigate_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

PageController controller = PageController();
List<OnBoardingModels> boarding = [
  OnBoardingModels(
    image: 'assets/images/onboarding1.svg',
    title: 'Get food deliver to your doorstep asap',
    body:
    'We have young and professional deliver team that will bring your food as soon as possible to your doorstep',
  ),
  OnBoardingModels(
    image: 'assets/images/onboarding2.svg',
    title: 'Buy Any Food from your favorite restaurant',
    body:
    'We are constantly adding favourite restaurant throughout the territory and around your area carefully selected',
  ),
  OnBoardingModels(
    image: 'assets/images/onboarding3.svg',
    title: 'Get food deliver to your doorstep asap',
    body:
    'We have young and professional deliver team that will bring your food as soon as possible to your doorstep',
  ),
];
bool isLast = false;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent[100],
                      borderRadius: BorderRadius.circular(25.0)),
                  child: DefaultTextButton(
                    text: 'skip',
                    onPressed: () {
                      navigateWithoutBack(
                        context: context,
                        widget:  LoginScreen(),);
                    },
                    isUpperCase: true,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: boarding.length,
                    controller: controller,
                    onPageChanged: (index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // logo
                          const Center(
                            child: Image(
                              image:
                              AssetImage('assets/images/7krave-logo.png'),
                              height: 90,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SvgPicture.asset(
                            boarding[index].image,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 3.5,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            boarding[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            boarding[index].body,
                            style: Theme
                                .of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      );
                    }),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: boarding.length,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 8,
                    spacing: 5.0,
                    activeDotColor: Colors.orangeAccent.shade100),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DefaultButton(
                text: 'Get Started',
                height: 46,
                onPressed: () {
                  if (isLast) {
                    navigateWithoutBack(
                      context: context,
                      widget:  LoginScreen(),);
                  } else {
                    controller
                        .nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                backgroundColor: Colors.teal.shade300,
                width: double.infinity,
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  DefaultTextButton(
                    text: 'Sign Up',
                    onPressed: () {
                      navigateWithoutBack(
                          context: context,
                          widget:  const RegisterScreen(),);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
