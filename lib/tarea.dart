// ignore_for_file: unnecessary_this

//clase tarea
class Tarea {
  //va estar definido por dos estados 
  //el subrayado delante de un atributo significa que es privado
  String _nombre; 
  String _estado;         //el error freceunte que me aarroja es que falta inicializar las variables
  //constructor
  Tarea(this._nombre,this._estado);

  //metodos getter y setter
  String get nombre=>_nombre;
  String get estado=>_estado;
  //en el metodo set agregamos un parmatreo que permita recibir un tamaño de texto.
  set nombre(String nuevoNombre){

     if(nuevoNombre.length <=255){
       this._nombre=nuevoNombre;
     }
  }
  set estado(String nuevoEstado)=>this._estado=nuevoEstado;
}