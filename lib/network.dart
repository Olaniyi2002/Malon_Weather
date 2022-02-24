import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:reallife/Home/home.dart';
import 'package:reallife/main.dart';

import 'Home/template.dart';

const apikey = "814eb16735b61e0ffd9c820c7dc93ba1";
const city1='Lagos';


class Weather {
  String wind, humidity, feel, pressure, temp, city, description,image;

  Weather(
      {
        this.image,
        this.city,
      this.wind,
      this.humidity,
      this.pressure,
      this.feel,
      this.temp,
      this.description});

  factory Weather.formJson(Map<String, dynamic> json) {
    return Weather(
      image: json['weather'][0]['icon'].toString(),
        temp: json['main']['temp'].toString(),
        city: json['name'].toString(),
        humidity: json['main']['humidity'].toString(),
        feel: json['main']['feels_like'].toString(),
        pressure: json['main']['pressure'].toString(),
        wind:json['wind']['speed'].toString(),
        description: json['weather'][0]['description'].toString());
  }
}


class Network {
  Future<Weather> getWeather(var city) async {


     var apiurl =
         "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric";

    http.Response response = await http.get(apiurl);

    if (response.statusCode == 200) {
      return Weather.formJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load');
    }
  }
}

