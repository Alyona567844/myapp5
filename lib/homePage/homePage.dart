import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/car.dart';
import 'package:myapp/models/carData.dart';
import 'package:myapp/widget/carWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio client = Dio();
  String url = 'https://myfakeapi.com/api/cars';
  List<Car> carList = [];

  void getData() async {
    var response = await client.get(url);
    carList = CarData.fromJson(response.data).cars;
    print(carList);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: carList.length,
            itemBuilder: (context, index,) {
              return CarWidget(
                car: carList[index],
                index: index + 1,
              );
            }),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('List of cars')],
          ),
        ));
  }
}
