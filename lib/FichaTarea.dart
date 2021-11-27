//creacion de ficha de tarea
import 'package:flutter/material.dart';

//hacemos un extends de statelesswidget por que no va cambiar su estado
class FichaTarea extends StatelessWidget {
  final String titulo;
  final String estado;
//constructor: le pasamos dos parametros el titulo y el estado
  FichaTarea({
     Key? key,                                            // key key   , ....              
    required this.titulo,
    required this.estado,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          //creamos un objeto de tipo expanded,
          // lo que va hacer que el objeto se auste al tamaño disponible
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  titulo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  estado,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
