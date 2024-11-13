import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:tarea_6/services/weather_service.dart';
import 'package:weather/weather.dart';

class WeatherInDRView extends StatefulWidget {
  const WeatherInDRView({super.key});

  @override
  WeatherInDRViewState createState() => WeatherInDRViewState();
}

class WeatherInDRViewState extends State<WeatherInDRView> {
  final WeatherFactory _wf = WeatherFactory(
      dotenv.env['OPENWEATHER_API_KEY'] ?? '',
      language: Language.SPANISH);

  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName("Santo Domingo").then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              _locationHeader(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
              ),
              _dateTimeInfo(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              _weatherIcon(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              _currentTemp(),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              _extraInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationHeader() {
    return Text(
      _weather?.areaName ?? "",
      style: const TextStyle(color: Color.fromARGB(255, 84, 124, 255)),
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("hh:mm a", 'es_ES').format(now),
          style: const TextStyle(
              color: Color.fromARGB(255, 84, 124, 255), fontSize: 35),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE", 'es_ES').format(now),
              style: const TextStyle(
                  color: Color.fromARGB(255, 84, 124, 255),
                  fontWeight: FontWeight.w700),
            ),
            Text(
              " ${DateFormat("d/m/y", 'es_ES').format(now)}",
              style: const TextStyle(
                  color: Color.fromARGB(255, 84, 124, 255),
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png'))),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: const TextStyle(
              color: Color.fromARGB(255, 98, 110, 148), fontSize: 20),
        )
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)} °C",
      style: const TextStyle(
          color: Color.fromARGB(255, 84, 124, 255),
          fontSize: 90,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _extraInfo() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: MediaQuery.sizeOf(context).width * 0.80,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 84, 124, 255),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Temp. Máx.: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)} °C",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              Text(
                "Temp. Mín.: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)} °C",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Vientos: ${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              Text(
                "Humedad: ${_weather?.humidity?.toStringAsFixed(0)}%",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
