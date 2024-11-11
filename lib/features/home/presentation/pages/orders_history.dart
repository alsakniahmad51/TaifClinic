import 'package:clinic/core/util/constants.dart';
import 'package:clinic/core/util/functions/navigator.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/pages/order_detailes.dart';
import 'package:clinic/features/home/presentation/widgets/orders_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AllOrdersPage extends StatelessWidget {
  final List<Order> allOrders;

  const AllOrdersPage({super.key, required this.allOrders});

  @override
  Widget build(BuildContext context) {
    allOrders.sort((a, b) => b.date.compareTo(a.date));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('سجل الطلبات'),
      ),
      body: allOrders.isEmpty
          ? const Center(
              child: Text('لا توجد طلبات حالياً'),
            )
          : ListView.builder(
              itemCount: allOrders.length,
              itemBuilder: (context, index) {
                String dateTime = allOrders[index].date.toString();
                var parts = dateTime.split(' ');
                String date = parts[0];
                return OrdersItem(
                  data: allOrders[index],
                  time: date,
                );
              },
            ),
    );
  }
}



// class OrdersHistoryItem extends StatelessWidget {
//   const OrdersHistoryItem({super.key, required this.data});
//   final Order data;
//   @override
//   Widget build(BuildContext context) {
//     String dateTime = data.date.toString();
//     var parts = dateTime.split(' ');
//     String date = parts[0];
//     // String timefake = parts[1];
//     // var partTime = timefake.split('.');
//     // String time = partTime[0];

//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: SizedBox(
//           height: 80.h,
//           child: Padding(
//             padding: EdgeInsets.only(top: 10.h),
//             child: Card(
//               margin: EdgeInsets.symmetric(
//                 horizontal: 25.w,
//               ),
//               color: Colors.white,
//               child: ListTile(
//                 trailing: Padding(
//                   padding: EdgeInsets.only(top: 10.h),
//                   child: GestureDetector(
//                       onTap: () {
//                         Moving.navToPage(
//                             context: context, page: OrderDetailes(data: data));
//                       },
//                       child: SvgPicture.asset(
//                         info_icon,
//                         height: 24.h,
//                         width: 24.h,
//                       )),
//                 ),
//                 leading: Column(
//                   children: [
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Text(
//                       data.patientName,
//                       style: TextStyle(
//                           fontSize: 16.sp, fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(
//                       height: 9.h,
//                     ),
//                     Text(
//                       date,
//                       style: TextStyle(
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
