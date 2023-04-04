import 'package:http/http.dart' as http;
import 'package:sag_usuario_v3/Models/PasajeModelo.dart';

var link = 'https://sagapi.coiin.net/public/api/rutaCollection';

getData() async {
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    PasajeModelo data = pasajeModeloFromJson(res.body);
    return data;
  }
}
