import 'package:flutter/material.dart';

class ElementsPageView extends StatefulWidget {
  @override
  _ElementsPageViewState createState() => _ElementsPageViewState();
}

class _ElementsPageViewState extends State<ElementsPageView> {
  PageController _pageController = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: 2,
      itemBuilder: (c, i) {
        return _elementCell();
      },
    );
  }

  _elementCell() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[_chemicalSymbolContainer(), _elementTypeContainer()],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/testeimg.jpg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(32),
      ),
      padding: EdgeInsets.all(20),
    );
  }

  _chemicalSymbolContainer() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(192, 192, 192, 0.4),
      ),
      child: Center(
          child: Text(
        "Br",
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }

  _elementTypeContainer() {
    return Text("No metal");
  }
}
