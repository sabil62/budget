import 'package:budget/json/budget_indicator.dart';
import 'package:budget/json/day_month.dart';
import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: getBudgetBody(),
    );
  }

  Widget getBudgetBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)
            ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 60, 14, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Budget",
                        style: TextStyle(
                            fontSize: 21.6, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(AntDesign.plus),
                            SizedBox(
                              width: 19,
                            ),
                            Icon(AntDesign.search1)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(months.length, (index) {
                      return Container(
                        width: (size.width - 30) / 6,
                        child: Column(
                          children: [
                            Text(
                              months[index]["label"],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? primary
                                          : Colors.transparent,
                                      border: Border.all(
                                          color: currentIndex == index
                                              ? Colors.pink[500]
                                              : Colors.black.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Text(
                                      months[index]["day"],
                                      style: TextStyle(
                                          fontSize: 10.4,
                                          color: currentIndex == index
                                              ? Colors.grey[100]
                                              : Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          //for budget containers
          Column(
              children: List.generate(budgetIndicator.length, (index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 1, 0, 20),
              child: Container(
                height: 150,
                width: (size.width - 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 12, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        budgetIndicator[index]["label"],
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.36)),
                      ),
                      Row(
                        children: [
                          Text(
                            budgetIndicator[index]["total_price"],
                            style: TextStyle(
                                fontSize: 21.4,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            budgetIndicator[index]["percentage"],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.43)),
                          )
                        ],
                      ),
                      Container(
                        height: 4,
                        width: (size.width - 60) *
                            budgetIndicator[index]["indicator"],
                        decoration: BoxDecoration(
                            color: budgetIndicator[index]["color"],
                            borderRadius: BorderRadius.circular(23)),
                      )
                    ],
                  ),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
