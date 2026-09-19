object camion {

    const cosas = []

    method tara() {
        return 1000
    }

    method pesoTotal() {
        return self.tara() + self.pesoTotalDeLasCosas()
    }

    method cantidadTotalDeBultos() {
        return 
    }

    method cargarCosas(cosa){
        cosas.add(cosa)
        cosa.sufrirConsecuencias()
    }    

    method descargarCosa(cosa){
        cosas.remove(cosa)
    }

    method hayAlgunaCosaQuePesaEntre(valor1, valor2) {
        return cosas.any({c => c.peso().between(valor1, valor2)})
    }

    method cosaMasPesada() {
        return cosas.max({c => c.peso()})
    }

    method pesoTotalDeLasCosas() {
        return cosas.sum({c => c.peso()})
    } 

    method sonNumerosParLasCosasCargadas() {
        return cosas.all({c => c.peso().even()})
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