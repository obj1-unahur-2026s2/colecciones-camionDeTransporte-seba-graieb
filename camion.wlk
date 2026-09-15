object camion {

    const cosas = []

    method tara() {
        return 1000
    }

    method pesoTotal() {
        return self.tara() + self.pesoTotalDeLasCosas()
    }

    method cargarCosas(cosa){
        cosas.add(cosa)
    }    

    method descargarCosa(cosa){
        cosas.remove(cosa)
    }

    method pesoTotalDeLasCosas() {
        return cosas.sum({c => c.peso()})
    } // con all

    method sonNumerosParLasCosasCargadas() {
        return self.pesoTotalDeLasCosas().even()
    }

    method hayAlgunaCosaQuePesa(valor) {
       return cosas.any({c => c.peso() == valor })
    }

    method primerCosaCargadaConNivelDePeligrosidad(nivel) {
        return cosas.find({c => c.nivelDePeligrosidad() == nivel})
    }

    method cosasQueSuperanElNivelDePeligrosidad(nivel) {
        return cosas.filter({c => c.nivelDePeligrosidad() > nivel})
    }

    method cosasQueSuperanElNivelDePeligrosidadDe(cosa) {
        return cosas.filter({c => c.nivelDePeligrosidad() > cosa.nivelDePeligrosidad()})
    }

    method estaExcedidoDePeso() {
       return self.pesoTotal() > 2500
    }

    method puedeCircularEnRuta(nivel) {
        return not self.estaExcedidoDePeso() and not cosas.any({ c => c.peligrosidad() > nivel })
    }




}