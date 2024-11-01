import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    required this.title,
    required this.type,
    required this.time,
    required this.color,
    required this.participants,
  });

  final String title;
  final String type;
  final String time;
  final Color color;
  final List<String> participants;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox.fromSize(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            decoration: BoxDecoration(
              color: kColorGreenLight,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 40),
                  blurRadius: 30,
                  spreadRadius: -30,
                  color: kColorGreenLight.withOpacity(0.06),
                ),
              ],
            ),
            child: _child(),
          ),
        ),
        SizedBox.fromSize(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kColorGreenLight,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 30,
                  spreadRadius: -18,
                  color: kColorGreenLight.withOpacity(0.1),
                ),
              ],
            ),
            child: _child(),
          ),
        ),
      ],
    );
  }

  Widget _child() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.title,
                  style: kStyleBlack15600,
                ),
                Row(
                  children: [
                    Text(
                      widget.type,
                      style: kStyleGrey12400,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      CupertinoIcons.time,
                      size: 16,
                      color: kColorGreyTextColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.time,
                      style: kStyleGrey12400,
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                if (widget.participants.isNotEmpty)
                  Wrap(
                    spacing: 4,
                    children: [
                      ...widget.participants.map((imgUrl) {
                        return imgUrl.isNotEmpty
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(imgUrl),
                                radius: 19,
                              )
                            : Icon(
                                CupertinoIcons.person_crop_circle_fill,
                                size: 38,
                                color: Colors.grey.shade300,
                              );
                      }).toList(),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
