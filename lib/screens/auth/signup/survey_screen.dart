import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../bloc/surveyBloc/survey_bloc.dart';
import '../../../config/config.dart';
import '../../../config/route.dart';
import '../../../models/survey.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    final List<Survey> foodSurveys = [
      Survey(
        assetName: 'assets/img/eggroll.svg',
        subtitle: 'Eat with the fresh food from Japan',
        title: 'Japanese Food',
      ),
      Survey(
        assetName: 'assets/img/burger.svg',
        subtitle: 'Keep healthy with the vegetables food.',
        title: 'American Food',
      ),
      Survey(
        assetName: 'assets/img/pizza.svg',
        subtitle: 'Make your day always sweet.',
        title: 'Italian Food',
      ),
      Survey(
        assetName: 'assets/img/bakso.svg',
        subtitle: 'Try a variety of typical Indonesian food.',
        title: 'Indonesian Food',
      ),
    ];

    final List<Survey> flavourSurveys = [
      Survey(
        assetName: 'assets/img/chilli.svg',
        subtitle: 'Burn your day with spicy delicious food.',
        title: 'Spicy Food',
      ),
      Survey(
        assetName: 'assets/img/salt.svg',
        subtitle: 'Fill your lunch with various flavours.',
        title: 'Tasteful Food',
      ),
      Survey(
        assetName: 'assets/img/cake.svg',
        subtitle: 'Make your day always sweet.',
        title: 'Sweet Food',
      ),
      Survey(
        assetName: 'assets/img/anyfood.svg',
        subtitle: 'Try a variety of typical food in the world.',
        title: 'Any Food',
      ),
    ];

    final List<Survey> styleSurveys = [
      Survey(
        assetName: 'assets/img/vegan.svg',
        subtitle: 'Stay healthy with unique vegan menu.',
        title: 'Vegan',
      ),
      Survey(
        assetName: 'assets/img/vegetarian.svg',
        subtitle: 'We recommend the best food for you.',
        title: 'Vegetarian',
      ),
      Survey(
        assetName: 'assets/img/egglover.svg',
        subtitle: 'MEat lover gonna love the special resto',
        title: 'Meat Lover',
      ),
      Survey(
        assetName: 'assets/img/anyfood.svg',
        subtitle: 'Try a variety of typical food in the world.',
        title: 'Random',
      ),
    ];

    final Map<String, List<Survey>> allsurveys = {
      'Favorite food': foodSurveys,
      'Favorite falvour': flavourSurveys,
      'Food Style': styleSurveys,
    };

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0.w,
          ),
          child: PageView.builder(
              controller: controller,
              itemCount: allsurveys.length,
              itemBuilder: (_, int page) {
                final allsurveysList = allsurveys.entries.toList();

                return Column(
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What is your',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              '${allsurveysList[page].key}?',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              '${page + 1}',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              '/3',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              width: 16.w,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (_, int index) => BlocProvider(
                          create: (context) => SurveyBloc(),
                          child: SurveyCard(
                            allsurveysList[page].value[index],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style:
                              Theme.of(context).textButtonTheme.style!.copyWith(
                                    foregroundColor: MaterialStateProperty.all(
                                      Config.colors.kTextGrey1,
                                    ),
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                      ),
                                    ),
                                  ),
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(RouteGenerator.registered),
                          child: Text(
                            'Skip for now',
                          ),
                        ),
                        SizedBox(
                          width: 144.w,
                          child: page == 2
                              ? ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style!
                                      .copyWith(
                                        shape: MaterialStateProperty.all(
                                          const StadiumBorder(),
                                        ),
                                      ),
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    RouteGenerator.registered,
                                  ),
                                  child: Text(
                                    'Submit',
                                  ),
                                )
                              : ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style!
                                      .copyWith(
                                        shape: MaterialStateProperty.all(
                                          const StadiumBorder(),
                                        ),
                                      ),
                                  onPressed: () => controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  ),
                                  child: Text(
                                    'Next',
                                  ),
                                ),
                        ),
                      ],
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class SurveyCard extends StatelessWidget {
  const SurveyCard(this.model);

  final Survey model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(
            bottom: 16.h,
          ),
          padding: EdgeInsets.all(
            16.w,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                6.r,
              ),
              side: BorderSide(
                color:
                    state.isSelected ? Config.colors.kPrimary : Config.colors.kTextGrey3,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: ShapeDecoration(
                  color: Config.colors.kPrimaryLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    model.assetName,
                    width: 24.w,
                  ),
                ),
              ),
              SizedBox(
                width: 16.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      model.subtitle,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => BlocProvider.of<SurveyBloc>(context).add(Toggle()),
                child: BlocBuilder<SurveyBloc, SurveyState>(
                  builder: (context, state) {
                    return state.isSelected
                        ? SvgPicture.asset('assets/img/checklist.svg')
                        : SvgPicture.asset('assets/img/uncheck.svg');
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
