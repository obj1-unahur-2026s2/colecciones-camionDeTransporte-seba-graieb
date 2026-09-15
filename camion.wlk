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
        cosas.add(cosa)
    }

    method pesoTotalDeLasCosas() {
        return cosas.sum({c => c.peso()})
    }

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
    



}