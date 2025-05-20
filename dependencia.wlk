import rodados.*
class Dependencia {
    const flota = []
    var property empleados = 0 
    method agregarAFlota(rodado){
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
}