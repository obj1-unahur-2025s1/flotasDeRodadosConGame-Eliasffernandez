import rodados.*
class Pedido{
    var property pasajeros
    var property distancia 
    var property tiempoMaximo
    const property coloresIncompatibles = #{}

    method acelerar() {1.max(tiempoMaximo - 1)}
    method relajar() {tiempoMaximo= tiempoMaximo - 1}
    method initialize(){
        if(!distancia.between(1,1000)){
            self.error(distancia.toString() + "No es válido")
        }
        if(!distancia.between(1,100)){
            self.error(tiempoMaximo.toString() + "No es válido")
        }
        if(!distancia.between(1,100)){
            self.error(pasajeros.toString() + "No es válido")
        }
    }
    method agregarColorIncompatible(unColor){
        if(! coloresValidos.listaColores().contains(unColor)){
            self.error(unColor.toString() + "No es un color válido")
        }
        coloresIncompatibles.add(unColor)
    }
    method velocidadRequerida() = distancia / tiempoMaximo
    method puedeSatisfacer(unAuto) = unAuto.velocidadMaxima() >= self.velocidadRequerida() + 10
    && unAuto.capacidad() >= pasajeros
    && not self.colorIncompatible(unAuto.color())
    
    method colorIncompatible(unColor) = coloresIncompatibles.contains(unColor)
}