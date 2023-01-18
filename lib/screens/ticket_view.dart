import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> tickets;
  final bool? isColor;
  const TicketView({super.key, required this.tickets, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 168 : 169),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          //Blue part of the card
          Container(
            decoration: BoxDecoration(
                color: isColor == null ? Color(0xFF526799) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(AppLayout.getHeight(21)),
                )),
            padding: EdgeInsets.all(AppLayout.getHeight(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      tickets['from']['code'],
                      style: isColor == null
                          ? Styles.headLineStyle3.copyWith(color: Colors.white)
                          : Styles.headLineStyle3,
                    ),
                    const Spacer(),
                    const ThickContainer(
                      isColor: true,
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        SizedBox(
                          height: AppLayout.getHeight(24),
                          child: AppLayoutBuilderWidget(
                            sections: 6,
                            isColor: isColor,
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: 1.5,
                            child: Icon(
                              Icons.local_airport_rounded,
                              color: isColor == null
                                  ? Colors.white
                                  : Color(0xFF8ACCF7),
                            ),
                          ),
                        ),
                      ],
                    )),
                    const ThickContainer(
                      isColor: true,
                    ),
                    const Spacer(),
                    Text(
                      tickets['to']['code'],
                      style: isColor == null
                          ? Styles.headLineStyle3.copyWith(color: Colors.white)
                          : Styles.headLineStyle3,
                    )
                  ],
                ),
                Gap(AppLayout.getHeight(3)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(
                        tickets['from']['name'],
                        style: isColor == null
                            ? Styles.headLineStyle4
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle4,
                      ),
                    ),
                    Text(
                      tickets['flying_time'],
                      style: isColor == null
                          ? Styles.headLineStyle4.copyWith(color: Colors.white)
                          : Styles.headLineStyle4,
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(
                        tickets['to']['name'],
                        textAlign: TextAlign.end,
                        style: isColor == null
                            ? Styles.headLineStyle4
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Middle Orange part of the card
          Container(
            color: isColor == null ? Styles.orangeColor : Colors.white,
            child: Row(
              children: [
                SizedBox(
                  height: AppLayout.getHeight(20),
                  width: AppLayout.getWidth(10),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:
                              isColor == null ? Styles.bgColor : Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(AppLayout.getHeight(10)),
                              bottomRight:
                                  Radius.circular(AppLayout.getHeight(10))))),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                          (constraints.constrainWidth() / 15).floor(),
                          (index) => SizedBox(
                                width: AppLayout.getWidth(5),
                                height: AppLayout.getHeight(2),
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: isColor == null
                                            ? Colors.white
                                            : Colors.grey.shade300)),
                              )),
                    );
                  }),
                )),
                SizedBox(
                  height: AppLayout.getHeight(20),
                  width: AppLayout.getWidth(10),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:
                              isColor == null ? Styles.bgColor : Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppLayout.getHeight(10)),
                              bottomLeft:
                                  Radius.circular(AppLayout.getHeight(10))))),
                )
              ],
            ),
          ),
          //Bottom Orange part of the card
          Container(
            decoration: BoxDecoration(
                color: isColor == null ? Styles.orangeColor : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isColor == null
                      ? AppLayout.getHeight(21)
                      : AppLayout.getHeight(0)),
                  bottomRight: Radius.circular(isColor == null
                      ? AppLayout.getHeight(21)
                      : AppLayout.getHeight(0)),
                )),
            padding: EdgeInsets.only(
                top: AppLayout.getHeight(10),
                left: AppLayout.getWidth(16),
                right: AppLayout.getWidth(16),
                bottom: AppLayout.getHeight(16)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(
                      firstText: tickets['date'],
                      secondText: "Date",
                      alignment: CrossAxisAlignment.start,
                      isColor: isColor,
                    ),
                    AppColumnLayout(
                      firstText: tickets['departure_time'],
                      secondText: "Departure time",
                      alignment: CrossAxisAlignment.center,
                      isColor: isColor,
                    ),
                    AppColumnLayout(
                      firstText: "${tickets['number']}",
                      secondText: "Number",
                      alignment: CrossAxisAlignment.end,
                      isColor: isColor,
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
