import 'package:duseca_calender_app/Resources/Components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../AppConstant/app_constant.dart';
import '../Resources/Components/calander_custom.dart';
import '../Resources/Components/custom_app_bar.dart';
import '../Resources/Components/custom_bottom_group.dart';
import '../Resources/Components/upcoming_events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(

        backdropColor: kColorBackGround,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 100),
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
          drawer: MyDrawer(),
        child: Scaffold(
          backgroundColor: kColorBackGround,
          appBar: CustomAppBar(controller: _advancedDrawerController,),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(
                  color: kColorGrey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Calendar",
                      style: kStyleBlack28700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomButtonGroup(),
                      Container(
                        width: 48.w,
                        height: 48.h,
                        padding: EdgeInsets.all(13.r),
                        decoration: ShapeDecoration(
                          color: kColorBlue,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: kColorWhite),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x2D0081FF),
                              blurRadius: 16,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: const Icon(Icons.add, color: kColorWhite),
                      )
                    ],
                  ),
                ),
                MyCalendarWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Upcoming",
                      style: kStyleBlack28700,
                    ),
                  ),
                ),
                EventsListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
