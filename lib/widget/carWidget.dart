import 'package:flutter/material.dart';
import 'package:myapp/models/car.dart';

class CarWidget extends StatelessWidget {
  final Car car;
  final int index;
  const CarWidget({super.key, required this.car, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(color: Color.fromARGB(255, 22, 191, 157)),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(index.toString()),
          ],
        ),
        title: Row(children: [
          Text(car.brand, style: TextStyle(color: Colors.black, fontSize: 20),),
          Text(car.model,style: TextStyle(color: const Color.fromARGB(255, 59, 58, 58), fontSize: 20),)
        ],
        mainAxisAlignment: MainAxisAlignment.center,),
        subtitle: Column(
          children: [
            Text('Color: ${car.color}', style: TextStyle(color: const Color.fromARGB(255, 59, 58, 58)),),
            Text('Price: ${car.price.toString()}', style: TextStyle(color: const Color.fromARGB(255, 59, 58, 58)),),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (car.availability)
              Icon(Icons.check_circle)
            else
              Icon(Icons.close)
          ],
        ),
        hoverColor: Colors.cyan,
      ),
    );
  }
}