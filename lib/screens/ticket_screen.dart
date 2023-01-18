import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../widgets/layout_builder_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(20),
              vertical: AppLayout.getWidth(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              "Tickets",
              style: Styles.headLineStyle,
            ),
            Gap(AppLayout.getHeight(20)),
            const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(
                tickets: ticketList[1],
                isColor: false,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(15),
                  vertical: AppLayout.getWidth(20)),
              margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                        firstText: 'Flutter DB',
                        secondText: 'Passenger',
                        alignment: CrossAxisAlignment.start,
                        isColor: false,
                      ),
                      AppColumnLayout(
                        firstText: '549611891',
                        secondText: 'Passport',
                        alignment: CrossAxisAlignment.end,
                        isColor: false,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(
                    sections: 15,
                    isColor: true,
                    width: 5,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(
                        firstText: '5161111 1165',
                        secondText: 'Number of E-ticket',
                        alignment: CrossAxisAlignment.start,
                        isColor: false,
                      ),
                      AppColumnLayout(
                        firstText: 'B56D66G',
                        secondText: 'Booking code',
                        alignment: CrossAxisAlignment.end,
                        isColor: false,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(
                    sections: 15,
                    isColor: true,
                    width: 5,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/visa.png",
                                scale: 14,
                              ),
                              Text(
                                "***  4687",
                                style: Styles.headLineStyle3,
                              )
                            ],
                          ),
                          Gap(5),
                          Text(
                            "Payment method",
                            style: Styles.headLineStyle4,
                          )
                        ],
                      ),
                      AppColumnLayout(
                        firstText: '\$124.50',
                        secondText: 'price',
                        alignment: CrossAxisAlignment.end,
                        isColor: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            //Bar code
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppLayout.getHeight(21)),
                    bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                  )),
              margin: EdgeInsets.only(
                  left: AppLayout.getHeight(15),
                  right: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(
                  top: AppLayout.getHeight(15),
                  bottom: AppLayout.getHeight(15)),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: 'https://github.com/martinovovo',
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 60,
                  ),
                ),
              ),
            ),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(
                tickets: ticketList[1],
              ),
            ),
          ],
        ),
        Positioned(
          left: AppLayout.getHeight(25),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2)),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        ),
        Positioned(
          right: AppLayout.getHeight(25),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2)),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        ),
      ]),
    );
  }
}
