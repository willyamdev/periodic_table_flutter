import 'dart:convert';
import 'package:http/http.dart' as http;

class WikipediaApi {
  getDescriptionElement(String element, String languageCode) async {
    String url =
        "https://$languageCode.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles=$element";

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var description = [];

      for (var i = 0; i < data.length; i++) {
        var item = data["query"]["pages"];
        var key = item.keys.first;
        var keyname = item[key];
        description.add(keyname);
      }

      return description[0]['extract'].toString();
    } else {
      return "Erro ao carregar, confira sua conexão!";
    }
  }
}
