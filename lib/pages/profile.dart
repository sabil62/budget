import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController email =
      TextEditingController(text: "roman_lion@gmail.com");
  TextEditingController date = TextEditingController(text: "08-14-1999");
  TextEditingController password =
      TextEditingController(text: "passwordiswhatbro");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      body: getProfileBody(),
    );
  }

  Widget getProfileBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.02))
            ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 62, 20, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: texter(22.0, 1.0, weight: FontWeight.w700),
                      ),
                      Icon(AntDesign.setting)
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: (size.width - 44) * 0.4,
                        child: Center(
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(color: primary, width: 5.5),
                                shape: BoxShape.circle,
                                color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/profile/profile.jpg"),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(19.8, 0, 0, 5),
                        child: Container(
                          width: (size.width - 44) * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Roman Tanica",
                                style:
                                    texter(21.2, 1.0, weight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Credit Score: \$72.00 ",
                                style: texter(13.0, 0.4),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Neon Bank Country",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey[200], //jpt jugad
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 7.2,
                                ),
                                Text(
                                  "\$7348.90",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[100], //jpt jugad
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.4),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 49.6,
                            decoration: BoxDecoration(
                                color: primary,
                                border: Border.all(
                                    width: 1, color: Colors.grey[100]),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Center(
                                  child: Text("Update",
                                      style: texter(17.0, 0.9,
                                          weight: FontWeight.w500))),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: texter(14.0, 0.4),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: email,
                    style: texter(17.4, 1.0, weight: FontWeight.w700),
                    cursorColor: black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        focusColor: Colors.green),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Date of Birth",
                    style: texter(14.0, 0.4),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: date,
                    style: texter(17.4, 1.0, weight: FontWeight.w700),
                    cursorColor: black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        focusColor: Colors.green),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                    style: texter(14.0, 0.4),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: password,
                    style: texter(17.4, 1.0, weight: FontWeight.w700),
                    cursorColor: black,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        focusColor: Colors.green),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle texter(fontsize, opaci, {FontWeight weight = FontWeight.w600}) {
    return TextStyle(
        fontSize: fontsize,
        color: opaci == 0.9
            ? Colors.white
            : Colors.black.withOpacity(opaci), //jpt jugad
        fontWeight: weight);
  }
}
