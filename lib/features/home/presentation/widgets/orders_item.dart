import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/pages/order_detailes.dart';
import 'package:clinic/features/home/presentation/widgets/title_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({
    super.key,
    required this.data,
    required this.time,
  });
  final Order data;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: InkWell(
          onTap: () {
            Moving.navToPage(
                context: context,
                page: OrderDetailes(
                  data: data,
                ));
          },
          child: SizedBox(
            height: 80.h,
            child: Card(
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              color: const Color(0xfffefefe),
              child: ListTile(
                trailing: Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(bottom: 13.h),
                  child: SvgPicture.asset(
                    x_ray_icon,
                    height: 44.h,
                    width: 44.w,
                  ),
                ),
                title: TitleListTile(
                  data: data,
                  time: time,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
