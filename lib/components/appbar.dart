import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/img/hamburger_icon.png', width: 20, height: 20, color: Colors.white),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text("AI HEALTH CARE",
                style: TextStyle(fontFamily: 'Roboto', color: Colors.white)),
          ),
          Image.asset('assets/img/shoulder_press_icon.png',
              width: 35, height: 35)
        ],
      )),
    );
  }
}
