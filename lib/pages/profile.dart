import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                                border: Border.all(color: primary, width: 5),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle texter(fontsize, opaci, {FontWeight weight = FontWeight.w500}) {
    return TextStyle(
        fontSize: fontsize,
        color: Colors.black.withOpacity(opaci),
        fontWeight: weight);
  }
}
