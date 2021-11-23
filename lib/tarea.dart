//clase tarea
class Tarea {
  //va estar definido por dos estados 
  //el subrayado delante de un atributo significa que es privado
  String _nombre, _Estado;
  //constructor
  Tarea(this._nombre,this._Estado);

  //metodos getter y setter
  String get nombre=>_nombre;
  String get estado=>_Estado;
  //en el metodo set agregamos un parmatreo que permita recibir un tamaño de texto.
  set nombre(String nuevoNombre){
     if(nuevoNombre.length<=300){
       this._nombre=nuevoNombre;
     }
  }
  set estado(String nuevoEstado)=>this._Estado=nuevoEstado;
}