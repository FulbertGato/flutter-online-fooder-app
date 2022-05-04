import 'package:customer_app/screens/profil/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'foodStyle/food_style_screen.dart';
import 'home/home_screen.dart';
import 'order/order_screen.dart';

final List<Widget> pages = [
  const HomeScreen(),
  const FoodStyleScreen(),
  const OrderScreen(),
  const ProfilScreen(),
  
];

class TabScreen extends StatefulWidget {
  const TabScreen({Key ?key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late int tabIndex;

  @override
  void initState() {
    tabIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        elevation: 5,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/img/nav_home.svg',
              width: 24.w,
            ),
            label: '',
            icon: SvgPicture.asset(
              'assets/img/nav_home_nfill.svg',
              width: 24.w,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/img/nav_foodstyle.svg',
              width: 24.w,
            ),
            label: '',
            icon: SvgPicture.asset(
              'assets/img/nav_foodstyle_nfill.svg',
              width: 24.w,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/img/nav_order.svg',
              width: 24.w,
            ),
            label: '',
            icon: SvgPicture.asset(
              'assets/img/nav_order_nfill.svg',
              width: 24.w,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/img/nav_user.svg',
              width: 24.w,
            ),
            label: '',
            icon: SvgPicture.asset(
              'assets/img/nav_user_nfill.svg',
              width: 24.w,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: pages.elementAt(tabIndex),
      ),
    );
  }
}

