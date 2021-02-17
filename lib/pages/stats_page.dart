import 'package:budget/json/stats_json.dart';
import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class StatsApp extends StatefulWidget {
  @override
  _StatsAppState createState() => _StatsAppState();
}

class _StatsAppState extends State<StatsApp> {
  int monthIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getStatsBody(),
      backgroundColor: Colors.grey.withOpacity(0.05),
    );
  }

  Widget getStatsBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 3,
                  color: Colors.black.withOpacity(0.03))
            ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stats",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        AntDesign.search1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(stats.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            monthIndex = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 6,
                          child: Column(
                            children: [
                              Text(
                                stats[index]["year"],
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 32,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: index == monthIndex
                                            ? primary
                                            : Colors.grey[400]),
                                    color: index == monthIndex
                                        ? primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(9)),
                                child: Center(
                                  child: Text(
                                    stats[index]["month"],
                                    style: TextStyle(
                                        color: index == monthIndex
                                            ? Colors.grey[100]
                                            : Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
