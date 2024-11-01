import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:duseca_calender_app/Resources/Components/activity_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class ActivityChart extends StatefulWidget {
  const ActivityChart({Key? key}) : super(key: key);

  @override
  State<ActivityChart> createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19040F15),
              blurRadius: 30,
              offset: Offset(0, 20),
              spreadRadius: -18,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Activity',
                    style: kStyleBlack20600,
                  ),
                  SvgPicture.asset("assets/images/More 2.svg"),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                children: [
                  Text(
                    '684,68K',
                    style: kStyleBlack28700,
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: ShapeDecoration(
                      color: const Color(0x1954D469),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '6.18%',
                        style: kStyleGreen15600,
                      ),
                    ),
                  ),
                ],
              ),
              const LineChartSample2()


            ],
          ),
        ),
      ),
    );
  }
}
