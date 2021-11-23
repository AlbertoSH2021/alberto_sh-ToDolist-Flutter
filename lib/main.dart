import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto to do list en flutter',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: ListaTareas(),
    );
  }
}

class ListaTareas extends StatefulWidget{
  @override
  State<StatefulWidget>createState(){
    return ListaTareasState();
  }
}

class ListaTareasState extends State<ListaTareas>{
  List<Tarea> listaTareas;
}