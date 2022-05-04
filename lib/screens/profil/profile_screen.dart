import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/config.dart';
import '../../models/info.dart';
import '../../widgets/home/custom_switcher.dart';
class ProfilScreen extends StatefulWidget {
  const ProfilScreen({ Key? key }) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final List<Info> infos = [
      Info('assets/img/pin2.svg', 'Location'),
      Info('assets/img/payment.svg', 'Payment'),
      Info('assets/img/info.svg', 'Information'),
      Info('assets/img/security.svg', 'Security'),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              Text(
                'Profile',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/img/illu9.svg',
                    width: 80.w,
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Farhan Fauzan',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          'Supreme Vegetarian',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Config.colors.kTextGrey1,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Personal Information',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Config.colors.kTextGrey1,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              ...List.generate(
                infos.length,
                (index) =>
                    InfoCard(infos[index], isLast: index == infos.length - 1),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Notifications',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Config.colors.kTextGrey1,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 24.h,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.r,
                          ),
                        ),
                        color: Config.colors.kPrimaryLight,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/img/discount.svg',
                          width: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: Text(
                        'Discount notifications',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const DiscountSwitch(),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard(this.info, {this.isLast = false});

  final Info info;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
                  color: Config.colors.kTextGrey3,
                  width: 2.sp,
                ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  6.r,
                ),
              ),
              color: Config.colors.kPrimaryLight,
            ),
            child: Center(
              child: SvgPicture.asset(
                info.assetName,
                width: 24.sp,
              ),
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: Text(
              info.name,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/img/arrow.svg',
              width: 16.w,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
    );
  }
}

class DiscountSwitch extends StatefulWidget {
  const DiscountSwitch({
    Key? key,
  }) : super(key: key);

  @override
  _DiscountSwitchState createState() => _DiscountSwitchState();
}

class _DiscountSwitchState extends State<DiscountSwitch> {
  late bool isOn;

  @override
  void initState() {
    isOn = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSwitch(
        value: isOn,
        onChanged: (bool val) {
          setState(() {
            isOn = val;
          });
        });
  }
}
