import 'package:clinic/features/home/presentation/widgets/page_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.pageViewBody});
  final PageViewBody pageViewBody;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child:
              SvgPicture.asset(fit: BoxFit.fill, widget.pageViewBody.imagePath),
        ),
        // AnimatedContainer(
        //   padding: widget.pageViewBody.padding,
        //   duration: const Duration(milliseconds: 200),
        //   child: SvgPicture.asset('assets/svgimages/navBarSellect.svg'),
        // ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 64.w, top: 3.h),
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.pageViewBody.pageController.jumpToPage(0);
                    widget.pageViewBody.animateNavBar(0);
                  });
                },
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w, bottom: 21.h),
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.pageViewBody.pageController.jumpToPage(1);
                    widget.pageViewBody.animateNavBar(1);
                  });
                },
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w, bottom: 23.h),
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.pageViewBody.pageController.jumpToPage(2);
                    widget.pageViewBody.animateNavBar(2);
                  });
                },
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 36.w, bottom: 26.h),
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.pageViewBody.pageController.jumpToPage(3);
                    widget.pageViewBody.animateNavBar(3);
                  });
                },
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
