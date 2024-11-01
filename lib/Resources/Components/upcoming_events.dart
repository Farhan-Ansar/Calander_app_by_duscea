import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:duseca_calender_app/Resources/Components/upcoming_widget.dart';
import 'package:duseca_calender_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EventsListView extends StatefulWidget {
  @override
  _EventsListViewState createState() => _EventsListViewState();
}

class _EventsListViewState extends State<EventsListView> {
  List<DateTime> upcomingTimes = [];
  List<EventModel> events = [];

  @override
  void initState() {
    super.initState();
    upcomingTimes = getUpcomingTimes();
  }

  List<DateTime> getUpcomingTimes() {
    DateTime now = DateTime.now();

    // Round up to the next half or full hour
    DateTime nextHalfOrFullHour =
        DateTime(now.year, now.month, now.day, now.hour, 0);
    if (now.minute >= 0 && now.minute <= 30) {
      nextHalfOrFullHour = DateTime(now.year, now.month, now.day, now.hour, 30);
    } else {
      nextHalfOrFullHour =
          DateTime(now.year, now.month, now.day, now.hour + 1, 0);
    }

    DateTime midnight = DateTime(now.year, now.month, now.day, 23, 59);
    List<DateTime> upcomings = [];

    while (nextHalfOrFullHour.isBefore(midnight)) {
      upcomings.add(nextHalfOrFullHour);
      nextHalfOrFullHour = nextHalfOrFullHour.add(const Duration(minutes: 30));
    }
    return upcomings;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: upcomingTimes.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        DateTime currentTime = upcomingTimes[index];
        DateTime? nextTime =
            index < upcomingTimes.length - 1 ? upcomingTimes[index + 1] : null;

        // Filter events that start within the current hour
        List<EventModel> eventsForCurrentHour = events.where((event) {
          return (event.startTime.isAfter(currentTime) &&
                  (nextTime != null && event.startTime.isBefore(nextTime))) ||
              event.startTime.isAtSameMomentAs(currentTime) ||
              (nextTime != null && event.startTime.isAtSameMomentAs(nextTime));
        }).toList();

        return Row(
          children: [
            Text(
              "${upcomingTimes[index].hour.toString().padLeft(2, '0')}:${upcomingTimes[index].minute.toString().padLeft(2, '0')}",
              style: kStyleGrey15400,
            ),
            upcomingTimes[index].minute == 0
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
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
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 4,
                                height: 84,
                                decoration: ShapeDecoration(
                                  color: kColorGreen2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Brandbook and Guidebook ',
                                    style: kStyleBlack15600,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Coding',
                                        style: kStyleGrey12400,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.watch_later_rounded,
                                        size: 15,
                                        color: kColorGreyTextColor,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '08:30',
                                        style: kStyleGrey12400,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/User11.svg"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/User3.svg"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/User13.svg"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(
                                          "assets/images/User12.svg"),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: eventsForCurrentHour.isNotEmpty
                        ? Wrap(
                            children: eventsForCurrentHour.map((event) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        TaskDetailDialog(event: event),
                                  );
                                },
                                child: TaskCard(
                                  title: event.title,
                                  color: getRandomColor(),
                                  time: DateFormat('MMMM d, y')
                                      .format(event.startTime),
                                  type: event.calenderType,
                                  participants: event.participants,
                                ),
                              );
                            }).toList(),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                  ),
          ],
        );
      },
    );
  }
}

Color getRandomColor() {
  return kColorBlues;
}

class TaskDetailDialog extends StatelessWidget {
  final EventModel event;

  TaskDetailDialog({required this.event});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(event.title),
    );
  }
}
