import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AdvancedDrawerController? controller;
  const CustomAppBar({super.key, this.controller});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              controller?.showDrawer();
              // Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset("assets/images/Menu [Mobile].svg"),
          ),
          const Spacer(),
          SvgPicture.asset("assets/images/Search.svg"),
          SizedBox(width: 20.w),
          SvgPicture.asset("assets/images/Setting.svg"),
          SizedBox(width: 20.w),
          SvgPicture.asset("assets/images/Notification.svg"),
          SizedBox(width: 20.w),
          SvgPicture.asset("assets/images/#5.svg"),
        ],
      ),
    );
  }
}
