import vehiculos.*

object roberto {
    var property peso = 90 
    var vehiculo = bicicleta

    method pesoTotal() {
        return peso + vehiculo.peso()
      
    }

    method cambiarVehiculo(unVehiculo) {
      vehiculo = unVehiculo
    }

    method puedeLlamar() = false
    
  
}

object chuckNorris {
  method pesoTotal() = 80
  method puedeLlamar() = true
}


object neo {
    var credito = 0
  method pesoTotal() = 0
  method puedeLlamar() = credito > 0
  method cargarCredito(valor) {credito += valor}
  method consumirCredito(valor) {
    credito = (credito - valor).max(0) 
    }
}

object flash {
    method pesoTotal() = 75
    method puedeLlamar() = true
}