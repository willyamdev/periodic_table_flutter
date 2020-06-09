class ChemicalElement {
  String _elementName; //Hoxigen, Gold..
  String _chemicalSymbol; // Br, Ue, H..
  int _elementType;

  ChemicalElement(this._elementName, this._chemicalSymbol, this._elementType);

  String get elementName => _elementName;
  String get chemicalSymbol => _chemicalSymbol;
  int get elementType => _elementType;
}