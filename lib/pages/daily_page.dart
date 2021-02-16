import 'package:budget/json/daily_json.dart';
import 'package:budget/json/day_month.dart';
import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeCalendar = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white,
                //no need for this shadow
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 10,
                      color: Colors.black.withOpacity(0.02)),
                ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Transaction",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      days.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeCalendar = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(
                                  days[index]["label"],
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.35)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == activeCalendar
                                          ? primary
                                          : Colors.transparent,
                                      border: Border.all(color: primary)),
                                  child: Center(
                                    child: Text(
                                      days[index]["day"],
                                      style: TextStyle(
                                          color: index == activeCalendar
                                              ? Colors.grey[100]
                                              : Colors.black.withOpacity(0.35)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Column(
            children: List.generate(daily.length, (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: (size.width - 50) * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: grey.withOpacity(0.1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      daily[index]["icon"],
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (size.width - 50) * 0.5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: Text(
                                          daily[index]["name"],
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700,
                                              color: black.withOpacity(0.7)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: Text(
                                          daily[index]["date"],
                                          style: TextStyle(
                                              color: Colors.grey[400]),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: (size.width - 50) * 0.3,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                daily[index]["price"],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: green,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Divider(
                      color: grey.withOpacity(0.4),
                      thickness: 0.6,
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
