import 'package:clinic/features/doctors/presentation/manager/docotr_cubit/doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clinic/features/home/domain/Entities/order.dart';
import 'package:clinic/features/home/presentation/widgets/home_text_field.dart';
import 'package:clinic/features/home/presentation/widgets/orders_item.dart';
import 'filter_page.dart';

class OrdersHistoryPage extends StatefulWidget {
  final List<Order> allOrders;

  const OrdersHistoryPage({super.key, required this.allOrders});

  @override
  _OrdersHistoryPageState createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<OrdersHistoryPage> {
  List<Order> filteredOrders = [];
  String? selectedImageType;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredOrders = widget.allOrders; // جميع الطلبات بشكل افتراضي
  }

  void _applyFilters(List<String>? doctorNames, String? imageType) {
    setState(() {
      filteredOrders = widget.allOrders.where((order) {
        bool matchesDoctor = doctorNames == null ||
            doctorNames.isEmpty ||
            doctorNames.contains(order.doctorName);

        bool matchesType = imageType == null ||
            order.detail!.type.typeName.toLowerCase() ==
                imageType.toLowerCase();

        return matchesDoctor && matchesType;
      }).toList();
    });
  }

  void _filterOrders(String query) {
    setState(() {
      filteredOrders = widget.allOrders
          .where((order) =>
              order.patientName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DoctorsCubit(RepositoryProvider.of(context))..fetchDoctors(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          title: const Text('سجل الطلبات'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: SearchTextFiled(
                textEditingController: searchController,
                hint: 'ابحث عن اسم المريض',
                onChanged: _filterOrders,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FilterPage(),
                    ),
                  );
                  if (result != null) {
                    _applyFilters(
                        result['selectedDoctors'], result['selectedImageType']);
                  }
                },
              ),
            ),
            Expanded(
              child: filteredOrders.isEmpty
                  ? const Center(child: Text('لا توجد طلبات حالياً'))
                  : ListView.builder(
                      itemCount: filteredOrders.length,
                      itemBuilder: (context, index) {
                        String dateTime = filteredOrders[index].date.toString();
                        var parts = dateTime.split(' ');
                        String date = parts[0];
                        return OrdersItem(
                          data: filteredOrders[index],
                          time: date,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
