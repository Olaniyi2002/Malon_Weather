import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reallife/Detail/detail.dart';
import 'package:reallife/Home/template.dart';
import 'package:reallife/network.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Network _network = new Network();
  var apiurl = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Current Weather",
            style: TextStyle(color: Colors.deepPurpleAccent),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (_, index) => FutureBuilder<Weather>(
                            future: _network.getWeather(item[index].city),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GestureDetector(
                                  onTap: () {
                                    apiurl =
                                        "https://api.openweathermap.org/data/2.5/weather?q=${item[index].city}&appid=$apikey&units=metric";
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Description(
                                                  model: item[index].city,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(20.0),
                                      height: height / 3.5,
                                      width: width / 2.5,
                                      decoration: BoxDecoration(
                                          border: Border.fromBorderSide(
                                              BorderSide.none),
                                          color: Colors.deepPurpleAccent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10.0,
                                                offset: Offset(3.0, 10.0))
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        item[index].country,
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      )),
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        item[index].city,
                                                        style: TextStyle(
                                                            color: Colors.white,fontSize: 30),
                                                      )),
                                                ],
                                              ),

                                              Image.network("https://openweathermap.org/img/wn/${snapshot.data.image.toString()}@2x.png")
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  '${snapshot.data.description.toString()}',style: TextStyle(
                                                  color: Colors.white,),),
                                              Text(
                                                  '${snapshot.data.temp.toString()}\u00B0C',style: TextStyle(
                                                  color: Colors.white,),),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return AlertDialog(
                                  title: Text(
                                    'Network Error',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.blue),
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor: Colors.deepPurpleAccent,
                                ));
                              }
                            })))
              ],
            ),
          ),
        ));
  }
}
//GestureDetector
//(
//                       onTap: () {
//                         apiurl =
//                         "https://api.openweathermap.org/data/2.5/weather?q=${item[index]
//                             .city}&appid=$apikey&units=metric";
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     Description(
//                                       model: item[index].city,
//                                     )));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: height / 1.5,
//                           width: width / 2.5,
//                           decoration: BoxDecoration(
//                               border: Border.fromBorderSide(BorderSide.none),
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 10.0,
//                                     offset: Offset(3.0, 10.0))
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Image.network(item[index].image),
//                               ),
//                               Container(child: Text(item[index].city + ", " +
//                                   item[index].country)),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
