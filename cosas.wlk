object knightRider {

    method peso() {
        return 500
    }

    method nivelDePeligrosidad() {
        return 10
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

    method nivelDePeligrosidad () {
        return estaTransformadoEn.nivelDePeligrosidad()
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