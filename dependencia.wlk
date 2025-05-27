import rodados.*
class Dependencia {
    const flota = [] 
    const pedidos = #{}
    var property empleados = 0 

    method agregarPedido(unPedido) {pedidos.add(unPedido)}
    method quitarPedido(unPedido) {pedidos.remove(unPedido)}


    method agregarAFlota(rodado){
        if(coloresValidos.listaColores().contains(rodado.color())){
            self.error("el auto no tiene un color válido")
        }
        flota.add(rodado)
    } 
    method quitarDeFlota(rodado){
        flota.remove(rodado)
    }
    method pesoTotalFlota() = flota.sum({r=> r.peso()})

    method estaBienEquipada() = self.tieneAlMenosRodados(3) && self.todosVanAlMenosA100()
    method tieneAlMenosRodados(cantidad) = flota.size() > cantidad
    method todosVanAlMenosA100() = flota.all({v=> v.velocidadMaxima() >= 100})

    method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({r=>r.capacidad()})
    method rodadosDeColor(color) = flota.filter({r=>r.color() == color})

    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
    method rodadoMasRapido() = flota.max({r=>r.velocidadMaxima()})
    
    method capacidadFaltante() = (empleados - self.capacidadDeLaFlota()).max(0)
    method capacidadDeLaFlota() =  flota.sum({r=> r.capacidad()})

    method esGrande() = empleados >= self.tieneAlMenosRodados(5)
    method totalPasajerosEnPedidos() = pedidos.sum({p=> p.pasajeros()})
    method pedidosNoPuedenSerSatisfechos() = pedidos.filter({p=> not self.hayAlgunRodadoQuePuedenSatisfacerElPedido(p)})
    method hayAlgunRodadoQuePuedenSatisfacerElPedido(unPedido) = flota.any({r=>unPedido.puedeSatisfacer(r)})
    method todosLosPedidosTienenIncompatibles(unColor) = pedidos.all({p=>p.coloresIncompatibles().contains(unColor)}) 
    method relajarTodosLosPedidos() {
        pedidos.forEach({p=>p.relajar()})
    }
}