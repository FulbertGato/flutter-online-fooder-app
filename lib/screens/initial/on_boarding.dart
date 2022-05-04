import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../config/route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef PageDetail = Map<String, Object>;

class OnboardingScreen extends StatelessWidget {
  final pageController = PageController();

  final List<PageDetail> pages = [
    {
      'text': 'Welcome to the foodes.',
      'bgImg': 'assets/img/welcomescreenbg.svg',
      'foreImg': 'assets/img/logo.svg',
      'size': 231.w,
      'isFirst': true,
      'isLast': false
    },
    {
      'text': 'We suggest the best food for you.',
      'bgImg': 'assets/img/suggestscreenbg.svg',
      'foreImg': 'assets/img/illu1.svg',
      'size': 414.w,
      'isFirst': false,
      'isLast': false
    },
    {
      'text': 'Ready for looking delicious food?',
      'bgImg': 'assets/img/readyscreenbg.svg',
      'foreImg': 'assets/img/illu2.svg',
      'size': 414.w,
      'isFirst': false,
      'isLast': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors.kPrimary,
      body: SafeArea(
        child: PageView.builder(
          itemCount: pages.length,
          controller: pageController,
          itemBuilder: (_, int index) =>
              PageScaffold(pages[index], pageController),
        ),
      ),
    );
  }
}

class PageScaffold extends StatelessWidget {
  const PageScaffold(this.pageDetail, this.pageController);

  final PageDetail pageDetail;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors.kPrimary,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              pageDetail['bgImg'] as String,
              width: 1.sw,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              pageDetail['foreImg'] as String,
              width: pageDetail['size'] as double,
            ),
          ),
          Column(
            children: [
              Spacer(
                flex: 1,
              ),
              SizedBox(
                width: 254.w,
                child: Text(
                  pageDetail['text'] as String,
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(
                flex: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: pageDetail['isLast'] as bool
                    ? Center(
                        child: SizedBox(
                          width: 188.w,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(RouteGenerator.login);
                            },
                            child: Text('Get started'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Config.colors.kTextBlack,
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              minimumSize: MaterialStateProperty.all(
                                Size(0, 56.h),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          !(pageDetail['isFirst'] as bool)
                              ? TextButton(
                                  onPressed: () {
                                    pageController.previousPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Text(
                                    'Back',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                  ),
                                )
                              : SizedBox(
                                  width: 1.w,
                                ),
                          TextButton(
                            onPressed: () {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            child: Text(
                              'Next',
                            ),
                          ),
                        ],
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
