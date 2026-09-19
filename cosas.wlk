object knightRider {

    method peso() {
        return 500
    }

    method nivelDePeligrosidad() {
        return 10
    }

    method cantidadDeBultos() {
        return 1
    }

    method sufrirConsecuencias() {

    }


}

object bumblebee {
    
    var estaTransformadoEn = auto

    method peso() {
        return 800
    }

    method transformacionARobot() {
        estaTransformadoEn = robot
    }

    method transformacionAAuto() {
        estaTransformadoEn = auto
    }  

    method nivelDePeligrosidad () {
        return estaTransformadoEn.nivelDePeligrosidad()
    }

    method cantidadDeBultos() {
        return 2
    }

    method sufrirConsecuencias() {
        self.transformacionARobot()   
    }

}

object auto {

    method nivelDePeligrosidad() {
        return 15
    }
}

object robot {

    method nivelDePeligrosidad() {
        return 30
    }
}

object paqueteDeLadrillo {

    var cantidadDeLadrillos = 1

    method peso() {
      return cantidadDeLadrillos * 2
    }

    method cambiarCantidadDeLadrillos(nuevaCant) {
        cantidadDeLadrillos = nuevaCant
    }

    method nivelDePeligrosidad() {
        return 2
    }

    method cantidadDeBultos() {
        if(cantidadDeLadrillos <= 100) {
            return 1
        }
        else if (cantidadDeLadrillos.between(101, 300)) {
            return 2
        }
        else {
            return 3
        }
    }

    method sufrirConsecuencias() {
        cantidadDeLadrillos = cantidadDeLadrillos + 12
    }
}

object arenaAGranel {

    var peso = 1

    method peso() {
        return peso
    }

    method cambiarPeso(pesoNuevo) {
        peso = pesoNuevo
    }

    method nivelDePeligrosidad() {
        return 1
    }

    method cantidadDeBultos() {
        return 1
    }

    method sufrirConsecuencias() {
        peso = peso - 10
    }

}

object bateriaAntiaerea {

    var estaConMisiles = true

    method peso() {
        if (estaConMisiles) {
            return 300
        }
        else {
            return 200
        }
    }

    method nivelDePeligrosidad() {
        if(estaConMisiles) {
            return 100
        }
        else {
            return 0
        }
    }

    method sacarMisiles() {
        estaConMisiles = false
    }

    method cargarMisiles() {
        estaConMisiles = true
    }

    method cantidadDeBultos() {
        if(!estaConMisiles) {
            return 1
        }
        else {
            return 2
        }
    }

    method sufrirConsecuencias() {
        self.cargarMisiles()
    }

}

object contenedorPortuario {

    const cosasContenidas = []

    method agregarCosaAlContenedor(cosa) {
        cosasContenidas.add(cosa)
    }

    method sacarCosaAlContenedor(cosa) {
        cosasContenidas.remove(cosa)       
    }

    method pesoTotalDeLasCosasContenidas() {
       return cosasContenidas.sum({c => c.peso()})
    }

    method objetoMasPeligrosoQueContiene() {
        return cosasContenidas.max({c => c.nivelDePeligrosidad()})
    }

    method peso() {
        return self.pesoTotalDeLasCosasContenidas() + 100
    }

    method nivelDePeligrosidad() {
        if (cosasContenidas.isEmpty()) {
            return 0
        }
        else {
            return self.objetoMasPeligrosoQueContiene().nivelDePeligrosidad()
        }
    }

    method cantidadDeBultosDeCosasContenidas() {
        return cosasContenidas.sum({c => c.cantidadDeBultos()})
    }

    method cantidadDeBultos() {
        return 1 + self.cantidadDeBultosDeCosasContenidas() 
    }

    method sufrirConsecuencias() {
        cosasContenidas.forEach({c => c.sufrirConsecuencias()})
    }

}

object residuosRadioactivos {

    var peso = 1

    method peso() {
        return peso
    }

    method nuevoPeso(nuevoPeso) {
        peso = nuevoPeso
    }

    method nivelDePeligrosidad() {
       return 200
    }

    method cantidadDeBultos() {
        return 1
    }

    method sufrirConsecuencias() {
        peso = peso + 15
    }

}

object embalajeDeSeguridad {

    var cosaQueEnvuelve = bateriaAntiaerea

    method peso() {
        return cosaQueEnvuelve.peso()
    }

    method nivelDePeligrosidad() {
        return cosaQueEnvuelve.nivelDePeligrosidad() / 2
    }

    method cambiarCosaQueEnvuelve(nuevaCosa) {
        cosaQueEnvuelve = nuevaCosa
    }

    method cantidadDeBultos() {
        return 2
    }

    method sufrirConsecuencias() {
        
    }

}