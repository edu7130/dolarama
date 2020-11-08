import 'dart:convert';
import 'package:dolarama/model/Dollar.dart';
import 'package:http/http.dart' as http;

class DaoDollar{

  static Future<List<Dollar>> getDollars() async {
    List<Dollar> listDollar = [];
    try {
      final response = await http
          .get('https://www.dolarsi.com/api/api.php?type=valoresprincipales')
          .timeout(Duration(seconds: 7));
      final body = json.decode(response.body);

      for (var json in body) {
        listDollar.add(Dollar.fromJSON(json['casa']));
      }

      // Quitamos algunos valores que no necesitamos
      listDollar.removeWhere((dollar) =>
          dollar.name == "Dolar" ||
          dollar.name == "Dolar Soja" ||
          dollar.name == "Bitcoin" ||
          dollar.name == "Dolar turista" ||
          dollar.name == "Argentina");

    }
    catch(_){}
    return listDollar;
  }

}