import 'package:chemicalelements/components/custom_app_bar.dart';
import 'package:chemicalelements/components/elements_page_view.dart';
import 'package:chemicalelements/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  ScreenHelper screenHelper;

  @override
  Widget build(BuildContext context) {
    screenHelper = ScreenHelper(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Container(
        width: screenHelper.width,
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_titleApp(), _pageViewContainer()],
        ),
      ),
    );
  }

  _titleApp() {
    return Text(
      "Chemical elements",
      style: TextStyle(
          fontSize: 30, fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
    );
  }

  _pageViewContainer() {
    return Expanded(child: LayoutBuilder(builder: (_, cons) {
      var gridY = cons.maxHeight / 100;
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: gridY * 3),
            height: gridY * 70,
            child: ElementsPageView(),
          ),
          Container(
            height: gridY * 27,
          ),
        ],
      );
    }));
  }
}
