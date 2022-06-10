import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/home_components/continue_button.dart';
import '../components/home_components/manage_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/img/sport.jpg")
          )
        ),
        child: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            title: MainAppBar(),
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: 0,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0))),
          ),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 50)),
          SliverList(
              delegate: SliverChildListDelegate(
                  <Widget>[continue_button(), setup_button()])),
        ]),
      ),
    );
  }
}
