import 'package:alberto_sh/FichaTarea.dart';
import 'package:flutter/material.dart';

import 'package:alberto_sh/nuevaTarea.dart';
import 'package:alberto_sh/tarea.dart';


//modificacion en la clase lista de tarea en el metodo añadir tarea
void main() {
  runApp( MyApp());
}

/*El proyecto no reconoce los metodos y la variables para anñadir una nueva tarea, 
por tal razon me voe obligado a suspender el desarrollo de la app y culminar
 el proyecto en php. Si lee esto Ingeniero le pido su comprension, 
tenia buenas intenciones en tratar de desarrollar el todolist en FLuttet pero aun caresco de conocimiento*/


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto to do list en flutter',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:  ListaTareas(),
    );
  }
}

class ListaTareas extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState(){
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
           return  GestureDetector(
             onTap:(){
               _editaTarea(listaTareas[posicion],this,posicion);
             },
             child: Dismissible(
               key: Key(item.nombre),
               onDismissed:(direction)  {eliminar(posicion);},
                        
               child: Card(
                  margin: const EdgeInsets.all(1.0),
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
         floatingActionButton: FloatingActionButton(
           tooltip: "Añadir tarea",
           child: const Icon(Icons.add),
           onPressed: (){
             _creartarea(this);
           },
         ),
     );
  }

void _creartarea (ListaTareasState obj)
{
  Navigator.push(context, 
  MaterialPageRoute(builder: (context)=>nuevaTarea(Tarea("",""),"añadir tarea",obj)),
    );
  actualizarListView();
} 



  void _editaTarea(Tarea tarea,ListaTareasState obj,int posicion){
    Navigator.push(
      context,MaterialPageRoute(
      builder: (context)=>nuevaTarea(tarea,'Editar Tarea',obj,posicion),
      ),
      );
      actualizarListView();
  }


  //metodop para remover si el exto ingresado es muy largo
  void eliminar(int posicion){
    this.listaTareas.removeAt(posicion);

    actualizarListView();
  } 

  //metodo de actulizar lista ventana
  void actualizarListView(){
    setState(() {
      this.listaTareas=listaTareas;
    });
  }
}