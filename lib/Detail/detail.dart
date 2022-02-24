import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reallife/Detail/cool.dart';
import 'package:reallife/network.dart';

class Description extends StatefulWidget {
  final model;

  const Description({Key key, this.model}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  Network _network = new Network();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _network.getWeather(widget.model);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: FutureBuilder<Weather>(
                    future: _network.getWeather(widget.model),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                height: height / 2,
                                width: width / 2,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10.0,
                                          offset: Offset(3.0, 10.0))
                                    ]),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.network(
                                        "https://openweathermap.org/img/wn/${snapshot.data.image.toString()}@4x.png",
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${widget.model}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${snapshot.data.temp.toString()}\u00B0C',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          '${snapshot.data.description.toString()}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
//                            Spacer(
//                              flex: 1,
//                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Weather Now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.deepPurpleAccent),
                                ),
                              ),
                            ),
                            Expanded(
                              child:  ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Things(
                                      weather: '${snapshot.data.wind.toString()} km/h',
                                      text: "Wind",
                                      icon: Icons.waves_outlined),
                                  Things(
                                      weather: '${snapshot.data.humidity.toString()}%',
                                      text: "Humidity",
                                      icon: Icons.wb_sunny),
                                  Things(
                                      weather: '${snapshot.data.pressure.toString()} mmHg',
                                      text: "Pressure",
                                      icon: Icons.filter_drama_outlined),
                                ],
                              ),
                            )
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return AlertDialog(
                          title: Text(
                            'Network Error',
                            style: TextStyle(fontSize: 30, color: Colors.blue),
                          ),
                        );
                      }
                      return Center(
                          child: const CircularProgressIndicator(
                        backgroundColor: Colors.deepPurpleAccent,
                      ));
                    }))
          ],
        ),
      ),
    );
  }
}


class Things extends StatelessWidget {
  final icon, weather, text;

  Things({this.icon, this.text, this.weather});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(8),
        height: height / 4,
        width: width / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 10.0, offset: Offset(3.0, 2.0))
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  height: height / 30,
                  width: width / 4.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurpleAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        icon,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        text,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(4),
                  height: height / 5.5,
                  width: width / 3.5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurpleAccent),
                  child: Center(
                    child: Text(weather, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
