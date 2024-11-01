import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../AppConstant/app_constant.dart';

class MessageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int? messageNumber;

  const MessageCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.messageNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      child: Container(
        width: double.infinity,
        height: 80.sp,
        decoration: ShapeDecoration(
          color: kColorWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              SvgPicture.asset(imagePath),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: kStyleBlack15400,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: description,
                          style: kStyleGrey15400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              if (messageNumber != null)
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: kColorRed2,
                  child: Text(
                    '$messageNumber',
                    textAlign: TextAlign.center,
                    style: kStyleWhite11700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
