import 'package:budget/json/create_budget_json.dart';
import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreateBudget extends StatefulWidget {
  @override
  _CreateBudgetState createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  int currentContainer;
  TextEditingController budget_name = TextEditingController(text: "Shopping");
  TextEditingController budget_price = TextEditingController(text: "\$720.0");
  bool buttonPink = false;
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
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentContainer = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Container(
                        height: 170,
                        width: (size.width - 90) / 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: currentContainer == index
                                ? Border.all(color: primary, width: 2)
                                : null),
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
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //section budget
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 5, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Budget name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  width: size.width,
                  child: TextField(
                    controller: budget_name,
                    style: styler(21.4, 1.0),
                    cursorColor: black,
                    decoration: InputDecoration(
                        hintText: "Enter your budget",
                        focusColor: Colors.green,
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Total budget",
                  style: styler(14.0, 0.4),
                ),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.72,
                      child: TextField(
                        cursorColor: black,
                        controller: budget_price,
                        style: styler(21.4, 1.0),
                        decoration: InputDecoration(
                            focusColor: Colors.green,
                            hintText: "Enter your budget",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Listener(
                      onPointerDown: (PointerEvent details) {
                        setState(() {
                          buttonPink = true;
                        });
                      },
                      onPointerUp: (PointerEvent eventer) {
                        setState(() {
                          buttonPink = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: buttonPink ? Colors.pink[800] : primary),
                        child: Center(
                            child: Icon(
                          AntDesign.arrowright,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle styler(fontSizer, opac) {
    return TextStyle(
        fontSize: fontSizer,
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(opac),
        letterSpacing: opac == 1 ? 0.8 : null);
  }
}
