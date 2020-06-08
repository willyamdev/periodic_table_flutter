import 'package:chemicalelements/components/custom_app_bar.dart';
import 'package:chemicalelements/components/elements_page_view.dart';
import 'package:chemicalelements/components/verticalProgressBar.dart';
import 'package:chemicalelements/controlers/home_controller.dart';
import 'package:chemicalelements/helpers/screen_helper.dart';
import 'package:chemicalelements/models/elements_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with HomeController {
  int filter = 3;
  int currentElement = 0;
  ScreenHelper screenHelper;
  ElementsList elementsList = ElementsList();

  @override
  Widget build(BuildContext context) {
    screenHelper = ScreenHelper(context);

    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
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
      "Elementos químicos",
      style: TextStyle(
          fontSize: 30, fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
    );
  }

  _pageViewContainer() {
    return Expanded(child: LayoutBuilder(builder: (_, cons) {
      var gridX = cons.maxWidth / 100;
      var gridY = cons.maxHeight / 100;
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: gridY * 3),
            height: gridY * 70,
            child: Row(
              children: <Widget>[
                Container(
                  width: gridX * 15,
                  child: Column(
                    children: <Widget>[
                      Text(
                        currentElement == 0
                            ? "1"
                            : (currentElement + 1).toString(),
                        style: TextStyle(
                            fontFamily: 'Quicksand', color: Colors.red),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                          child: VerticalProgressBar(currentElement + 1,
                              elementsList.elementsList.length)),
                      SizedBox(height: 5),
                      Text(
                        elementsList.elementsList.length.toString(),
                        style: TextStyle(fontFamily: 'Quicksand'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: gridX * 85,
                    child: ElementsPageView(
                      onChangeElement: (ei) {
                        setState(() {
                          currentElement = ei;
                        });
                      },
                      elementsList: elementsList.elementsList,
                    ))
              ],
            ),
          ),
          Container(
              height: gridY * 27,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _categoryButton(0, null),
                    _categoryButton(1,
                        "assets/images/elements_type_icons/icon_nonmetal.png"),
                    _categoryButton(2,
                        "assets/images/elements_type_icons/icon_gasnobre.png"),
                    _categoryButton(3,
                        "assets/images/elements_type_icons/icon_metaloid.png"),
                    _categoryButton(4,
                        "assets/images/elements_type_icons/icon_actinide.png"),
                    _categoryButton(5,
                        "assets/images/elements_type_icons/icon_actinide.png"),
                    _categoryButton(6,
                        "assets/images/elements_type_icons/icon_actinide.png"),
                    _categoryButton(7,
                        "assets/images/elements_type_icons/icon_actinide.png"),
                    _categoryButton(8,
                        "assets/images/elements_type_icons/icon_actinide.png"),
                    _categoryButton(9,
                        "assets/images/elements_type_icons/icon_actinide.png"),
                    _categoryButton(10,
                        "assets/images/elements_type_icons/icon_actinide.png"),
                  ],
                ),
              )),
        ],
      );
    }));
  }

  _categoryButton(int correspondentElement, String iconNotSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          filter = correspondentElement;
        });
      },
      child: Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.only(left: 7.5, right: 7.5),
          decoration: BoxDecoration(
              color: filter == correspondentElement
                  ? getElementColor(correspondentElement)
                  : Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                )
              ]),
          child: Center(
            child: correspondentElement == 0
                ? Text(
                    "Todos",
                    style: TextStyle(
                        color: filter == correspondentElement
                            ? Colors.white
                            : Colors.black),
                  )
                : Image.asset(
                    iconNotSelected,
                    width: 25,
                    height: 25,
                  ),
          )),
    );
  }
}
