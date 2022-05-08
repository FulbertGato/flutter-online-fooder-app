import 'package:customer_app/models/burger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config.dart';
import '../../config/route.dart';
import '../../models/menu.dart';
import '../../services/burgers/burger_service.dart';
import '../../services/menus/menu_service.dart';
import '../../widgets/home/food_card.dart';
import '../../widgets/home/menu_card.dart';
import '../../widgets/search_bar.dart';
  Future<List<Burger>> getBurgesList() async {
    List<Burger>  _burgers = await BurgerService.getAllBurgers();
      return _burgers;
    }

    Future<List<Menu>> getMenuList() async {
     List<Menu>  menus = await MenuService.getAllMenus();
      return menus;
    }
  
    final List<Burger> foods = BurgerService.getBurgersFatigue(getBurgesList());
    final List<Menu> menus = MenuService.getMenusList(getMenuList());

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

    
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    //onTap: () => Scaffold.of(context).openDrawer(),
                    child: SvgPicture.asset(
                      'assets/img/hamburger.svg',
                      width: 32.w,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'BRAZIL BURGER',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Text(
                'Salut Bg comment ça va aujourdhui ?',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Config.colors.kTextGrey1,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Text(
                'Bienvenue sur Brazil Buger!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: const SearchBar(),
            ),
           SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Row(
                children: [
                  Text(
                    'Nos Burgers  ',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '(100% made in senegal)',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Config.colors.kTextGrey1,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.w,
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0.w),
              height: 240.h,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    foods.length,
                    (index) => FoodCard(
                      food: foods[index],
                      onTap: () => Navigator.of(context)
                          .pushNamed(RouteGenerator.details, arguments: foods[index]),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Row(
                children: [
                  Text(
                    'Nos Menus ',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '(100% made in senegal)',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Config.colors.kTextGrey1,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.w,
            ),

            Container(
              padding: EdgeInsets.only(left: 8.0.w),
              height: 240.h,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    menus.length,
                    (index) => MenuCard(
                      menu: menus[index],
                      onTap: () => Navigator.of(context)
                          .pushNamed(RouteGenerator.detailsMenu, arguments: menus[index]),
                    ),
                  ),
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}









