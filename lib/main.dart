import 'package:alberto_sh/tarea.dart';
import 'package:flutter/material.dart';
import 'package:alberto_sh/FichaTarea.dart';
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
  late List<Tarea> listaTareas;
  
  @override
  Widget build(BuildContext context) {

    if(listaTareas==null) 
    listaTareas=[];

     return Scaffold(
       appBar: AppBar(
          title:const Text('Lista de Tarea'),
       ),
       body: ListView.builder(
         itemCount: listaTareas.length,
         itemBuilder: 
         (BuildContext context, int posicion){
           final item=listaTareas[posicion];
           return new GestureDetector(
             onTap:(){
               _editaTarea(listaTareas,this,posicion);
             },
             child: Dismissible(
               key: Key(item.nombre),
               onDismissed:(direction) {
                        eliminar(posicion);
                        },
               child: Card(
                  margin: EdgeInsets.all(1.0),
                  elevation: 2.0,
                  child: FichaTarea(
                    titulo:item.nombre,
                    estado:item.estado, 
                  ),
               ),
             ),
           );
         }
         ),
     );
  }

  //metodop para remover si el exto ingresado es muy largo
  void eliminar(int posicion){
    this.listaTareas.remove(posicion);

    actualizarListView();
  } 

  //metodo de actulizar lista ventana
  void actualizarListView(){
    setState(() {
      this.listaTareas=listaTareas;
    });
  }
}