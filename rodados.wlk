import wollok.game.*
import pedidos.*

class Corsa {
  var property color 
  var property position = new Position(x=4,y=7) //game.at(0,0) otra manera de escribirlo  // var lista = [] / new List()
  var property pasoPor = []
  method initialize(){
    if(not coloresValidos.listaColores().contanins(color)){
      self.error(color.toString() + "el auto no tiene un color válido") //toString para validar un string
    }
  }
  method pasajeros() = 4
  method velocidadMaxima()= 150
  method peso()= 1300
  //method position(nuevaPosicion) = pasoPor + nuevaPosicion
}

class Kwid{
  var property tieneTanque 
  method capacidad(){
    if(tieneTanque) 3 else 4
  }
  method velocidadMaxima(){
    if(tieneTanque) 110 else 120
  }
  method peso() = 1200 + if(tieneTanque) 150 else 0
  method color() = "azul"
}

object trafic {
  var property interior = comodo
  var property motor = pulenta
  method capacidad()= interior.capacidad()
  method velocidad()= motor.velocidad()
  method peso()= 4000 + interior.peso() + motor.peso()
  method color() = "blanco"
}

class Especiales{
  var property capacidad 
  const velocidadMaxima 
  var property peso 
  var property color  
  method velocidadMaxima() = velocidadMaxima.min(topeVelocidadMaxima.tope())
}
object topeVelocidadMaxima{
  var property tope = 200
}
object comodo{
  method capacidad()= 5
  method peso()=700
}

object popular{
  method capacidad()=12
  method peso()=1000
}

object pulenta{
  method peso()= 800
  method velocidad()= 130
}

object bataton {
  method peso()= 500
  method velocidad()= 80
}

object coloresValidos{
  const property listaColores = #{"rojo", "verde", "azul", "blanco", "negro"}
}