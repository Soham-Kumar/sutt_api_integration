import 'package:flutter/material.dart';
import 'train_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:flutter/src/widgets/framework.dart';
import 'station_input.dart';


Map mapResponse = {};
List listResponse = [];


class TrainData extends StatefulWidget {
  TrainData({required this.journeyStart,required this.journeyEnd});

  String journeyStart;
  String journeyEnd;

  @override
  State<TrainData> createState() => _TrainDataState();
}

class _TrainDataState extends State<TrainData> {
  Future<dynamic> apiCall1() async {
    Map<String, dynamic> mapdat = {
      "fromStationCode" : widget.journeyStart,
      "toStationCode" : widget.journeyEnd,
    };
    Uri uri = Uri.https('irctc1.p.rapidapi.com/', '/api/v2/trainBetweenStations', mapdat);
    http.Response response;
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "18af1cdc35msh487e0f4a2175322p1a4673jsnea2c3e98dd82",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }


  @override
  void initState() {
    apiCall1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView.builder(itemBuilder: (context, index){
            return Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Train Number : ",
                    ),
                    Text(
                      listResponse[index]['train_number'].toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Train Name : ",
                    ),
                    Text(
                      listResponse[index]['train_name'].toString(),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrainDetails(trainNo: listResponse[index]['train_number'] ),
                        ));
                  },
                  child: const Text(
                      "Get Train Details"
                  ),
                )
              ],
            );
          },
            itemCount: listResponse.length ,
          ),
        )
    );
  }
}