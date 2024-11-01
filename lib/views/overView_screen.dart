import 'package:duseca_calender_app/Resources/Components/activity_chart.dart';
import 'package:duseca_calender_app/Resources/Components/followers_chart.dart';
import 'package:duseca_calender_app/Resources/Components/gender_graph.dart';
import 'package:duseca_calender_app/Resources/Components/social_media_card.dart';
import 'package:duseca_calender_app/Resources/Components/statistics_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../AppConstant/app_constant.dart';
import '../Resources/Components/custom_app_bar.dart';
import '../Resources/Components/my_drawer.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
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
          appBar: CustomAppBar(
            controller: _advancedDrawerController,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: kColorGrey,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Overview",
                          style: kStyleBlack28700,
                        ),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: kColorWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 16,
                              offset: Offset(0, 14),
                              spreadRadius: -10,
                            )
                          ],
                        ),
                        child: SvgPicture.asset("assets/images/Progress.svg"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.w, color: kColorGrey),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        child: SvgPicture.asset("assets/images/Download.svg"),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 14,
                            left: 16,
                            right: 14,
                            bottom: 14,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: kColorGrey),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'This Week',
                                style: kStyleGrey15400,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: kColorGreyTextColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SocialMediaCard(
                        username: 'mitchell.cooper',
                        platform: 'Facebook',
                        followers: '353,49K',
                        growthPercentage: '1.43%',
                        iconPath: 'assets/images/facebook.svg',
                      ),
                      SocialMediaCard(
                        username: 'jane.doe',
                        platform: 'Instagram',
                        followers: '500,00K',
                        growthPercentage: '2.1%',
                        iconPath: 'assets/images/facebook.svg',
                      ),
                    ],
                  ),
                ),
                const FollowersChart(),
                const GenderGraph(),
                const ActivityChart(),
                const StatisticsGraph(),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
