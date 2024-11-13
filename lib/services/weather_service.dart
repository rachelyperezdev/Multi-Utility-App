import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = dotenv.env['OPENWEATHERMAP_API_KEY'] ?? '';
  //final double lat = 18.4801972;
  //final double lon = -69.942111;
  final double lat = 18.48;
  final double lon = -69.94;

  Future<Map<String, dynamic>> getWeatherData() async {
    final String url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&units=metric&lang=es&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Error al obtener la data del clima.');
      }
    } catch (e) {
      print(e);
      return {};
    }
  }
}
