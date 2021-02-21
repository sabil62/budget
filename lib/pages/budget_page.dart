import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
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
                              width: 14,
                            ),
                            Icon(AntDesign.search1)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 25) / 7,
                        child: Column(
                          children: [
                            Text(
                              "2021",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 27,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Text(
                                  "Sun",
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
