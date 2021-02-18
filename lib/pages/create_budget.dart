import 'package:budget/json/create_budget_json.dart';
import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreateBudget extends StatefulWidget {
  @override
  _CreateBudgetState createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCreateBudgetBody(),
      backgroundColor: Colors.grey.withOpacity(0.05),
    );
  }

  Widget getCreateBudgetBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  spreadRadius: 10,
                  blurRadius: 3),
            ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create Budget",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.05,
                        color: black),
                  ),
                  Icon(AntDesign.search1)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Choose Category",
                style: TextStyle(
                    fontSize: 16.4,
                    fontWeight: FontWeight.bold,
                    color: black.withOpacity(0.4)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 12, 6, 12),
            child: Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Container(
                      height: 170,
                      width: (size.width - 90) / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.3)),
                              child: Center(
                                child: Image.asset(
                                  categories[index]["icon"],
                                  height: 26,
                                  width: 26,
                                ),
                              ),
                            ),
                            Text(
                              categories[index]["name"],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.11,
                                  color: black),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
