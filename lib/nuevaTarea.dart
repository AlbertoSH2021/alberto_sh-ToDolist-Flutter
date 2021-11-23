//actualizacion de pagina para la creacion de neuvas tareas

import 'package:alberto_sh/main.dart';
import 'package:flutter/material.dart';
import 'package:alberto_sh/tarea.dart';

class nuevaTarea extends StatefulWidget {
  final Tarea tarea;
  final String appBartitle;
  ListaTareasState listaTareasState;
  int posicion;

  //constructor
  nuevaTarea(this.tarea, this.appBartitle, this.listaTareasState,
      [this.posicion = -1]);
  @override
  State<StatefulWidget> createState() {
    return nuevaTareaState(
        this.tarea, this.appBartitle, this.listaTareasState, this.posicion);
  }
}

class nuevaTareaState extends State<nuevaTarea> {
  ListaTareasState listaTareasState;
  String titulo;
  Tarea tarea;
  int posicion;
  bool marcado = false;

  nuevaTareaState(
      this.tarea, this.titulo, this.listaTareasState, this.posicion);

  TextEditingController tareaController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    tareaController.text = tarea.nombre;
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        leading: new GestureDetector(
          child: Icon(Icons.close),
          onTap: () {
            Navigator.pop(context);
            listaTareasState.actualizarListView();
          },
        ),
        title: Text(titulo),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 50.0),
            child: _estaEditando()  ? CheckboxListTile(
                    title: Text("Completada"),
                    value: marcado,
                    onChanged: (bool? valor) {
                      setState(() {
                        marcado = valor!;
                      });
                    },
                  )
                : Container(height:2),
                
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: tareaController,
              decoration: InputDecoration(
                labelText: "tarea",
                hintText: "describe la tarea",
              ),
              onChanged: (value) {
                actualizatTarea();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text("guardar"),
              onPressed: () {
                setState(() {
                  _guardar();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _guardar() {
    tarea.estado = "";
    if (_estaEditando()) {
      if (marcado) {
        tarea.estado = "completado";
      }
    }
    tarea.nombre = tareaController.text;
  }

  void actualizatTarea() {
    tarea.nombre = tareaController.text;
  }

  bool _estaEditando() {
    bool editando = false;
    if (this.posicion == -1)
     editando = true;
    return editando;
  }
}
