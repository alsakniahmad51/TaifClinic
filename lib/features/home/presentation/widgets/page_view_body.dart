// ignore_for_file: must_be_immutable

import 'package:clinic/core/util/constants.dart';
import 'package:clinic/features/home/presentation/pages/doctors_page.dart';
import 'package:clinic/features/home/presentation/pages/home_page.dart';
import 'package:clinic/features/notification/presentation/pages/notification_page.dart';
import 'package:clinic/features/home/presentation/pages/settings_page.dart';
import 'package:clinic/features/home/presentation/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class PageViewBody extends StatefulWidget {
  PageViewBody({
    super.key,
  });

  int currentIndex = 0;
  // EdgeInsetsGeometry padding = const EdgeInsets.only();
  String imagePath = home;
  var pageController = PageController(
    initialPage: 4,
  );
  void animateNavBar(int value) {
    if (value == 0) {
      // padding = EdgeInsets.only(right: 220.w);
      imagePath = settings;
    } else if (value == 1) {
      // padding = EdgeInsets.zero;
      imagePath = doctor;
    } else if (value == 2) {
      // padding = EdgeInsets.only(left: 220.w);
      imagePath = notification;
    } else if (value == 3) {
      // padding = EdgeInsets.only(left: 220.w);
      imagePath = home;
    }
  }

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          onPageChanged: (value) {
            setState(() {
              widget.animateNavBar(value);
            });
          },
          controller: widget.pageController,
          children: const [
            SettingsPage(),
            DoctorsPage(),
            NotificationPage(),
            HomePage(),
          ],
        ),
        // Nav BAr
        NavBar(
          pageViewBody: widget,
        )
      ],
    );
  }
}
