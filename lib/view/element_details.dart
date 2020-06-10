import 'package:chemicalelements/components/custom_app_bar.dart';
import 'package:chemicalelements/controlers/elements_type_controller.dart';
import 'package:chemicalelements/controlers/wikipedia_api.dart';
import 'package:chemicalelements/helpers/color_helper.dart';
import 'package:chemicalelements/models/chemical_element.dart';
import 'package:flutter/material.dart';

class ElementDetails extends StatelessWidget
    with ElementsTypeController, WikipediaApi {
  ChemicalElement element;
  ElementDetails(this.element);
  String descriptionText = "";

  _getDescription() async{
    descriptionText = await getDescriptionElement(element.elementName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Hero(
          tag: element.chemicalSymbol + 'bg',
          child: Container(
            color: getElementColor(element.elementType),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomAppBar("details"),
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: element.chemicalSymbol + "info",
                  child: Material(
                    type: MaterialType.transparency,
                    child: _chemicalSymbolContainer(element.chemicalSymbol),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Hero(
                  tag: element.chemicalSymbol + "type",
                  child: Material(
                      type: MaterialType.transparency,
                      child: _elementTypeContainer(element.elementType)),
                ),
                Hero(
                  tag: element.chemicalSymbol + "name",
                  child: Material(
                      type: MaterialType.transparency,
                      child: _elementName(element.elementName)),
                ),
                SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                    future: _getDescription(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          // TODO: Handle this case.
                          break;
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorHelper.primaryColor),));
                          break;
                        case ConnectionState.active:
                          // TODO: Handle this case.
                          break;
                        case ConnectionState.done:
                          return _elementDescription(descriptionText);
                          break;
                      }
                      return Container();
                    }),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  _chemicalSymbolContainer(String symbol) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(0, 0, 0, 0.4),
      ),
      child: Center(
          child: Text(
        symbol,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      )),
    );
  }

  _elementTypeContainer(int type) {
    return Text(getElementType(type),
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontFamily: 'Quicksand',
        ));
  }

  _elementName(String name) {
    return Text(name,
        style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold));
  }

  _elementDescription(String description) {
    return Text(description,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontFamily: 'Quicksand',
        ));
  }
}
