import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

class HotelScreen extends StatelessWidget {
  final Map<String, dynamic> hotels;

  const HotelScreen({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: AppLayout.getHeight(350),
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(14),
          vertical: AppLayout.getHeight(17)),
      margin: EdgeInsets.only(
          right: AppLayout.getWidth(17), top: AppLayout.getHeight(5)),
      decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.circular(AppLayout.getHeight(24)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: AppLayout.getHeight(20),
                spreadRadius: AppLayout.getHeight(7))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(180),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
                color: Styles.primaryColor,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/${hotels['image']}"))),
          ),
          Gap(AppLayout.getHeight(10)),
          Text(
            hotels['place'],
            style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
          ),
          Gap(AppLayout.getHeight(5)),
          Text(
            hotels['destination'],
            style: Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          Gap(AppLayout.getHeight(8)),
          Text(
            "\$${hotels['price']}/night",
            style: Styles.headLineStyle.copyWith(color: Styles.kakiColor),
          ),
        ],
      ),
    );
  }
}
