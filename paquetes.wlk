import destinos.*
import mensajeros.*
import mensajeria.*

object paquete{
    var estaPago = false
    var destino = brooklyn

    //method estaPago() = estaPago 
    method cambiarDestino(nuevoDestino){destino = nuevoDestino}
    method registrarPago(){estaPago = true}
    method cancelarPago(){estaPago = false}
    method puedeSerEntregado(unMensajero){
        return estaPago && destino.dejaPasar(unMensajero)
    }
}

object paquetito {
    method estaPago() = true
    method puedeSerEntregado(unMensajero) = true
}

object paqueton{
    const destinos = #{}
    var importePagado = 0
    method estaPago() = importePagado == self.precioTotal()
    
    method pagoParcial(unValor){
        importePagado = (importePagado + unValor ).min(self.precioTotal())
    }
    method precioTotal() = destinos.size() * 100

    method puedeSerEntregado(unMensajero){
        return self.estaPago() && destinos.all({d => d.dejaPasar(unMensajero)})
    }
}

object paquetazo{
    var destino = brooklyn
    method peso(){return 0} 

    method cambiarDestino(nuevoDestino){destino = nuevoDestino}
    method estaPago(){
        return self.peso() > 0
    }
    method puedeSerEntregado(unMensajero){
        return self.estaPago() && destino.dejaPasar(unMensajero) && unMensajero.pesoTotal() + self.peso() <= 500
    }
}
