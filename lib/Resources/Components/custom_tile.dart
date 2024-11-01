import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../AppConstant/app_constant.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  final bool trailing;
  final int? number;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
    this.trailing = false,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(image),
      title: Text(
        title,
        style: kStyleBlack15600,
      ),
      trailing: trailing
          ? (number != null
              ? CircleAvatar(
                  backgroundColor: kColorRed,
                  radius: 10,
                  child: Text(
                    number.toString(),
                    style: const TextStyle(color: kColorWhite, fontSize: 12),
                  ),
                )
              : const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kColorBlue,
                  size: 15,
                ))
          : null,
      onTap: onTap,
    );
  }
}
