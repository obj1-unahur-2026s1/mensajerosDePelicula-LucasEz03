import mensajeros.*
import paquetes.*




object empresa {
    const mensajeros = []

    method mensajeros() = mensajeros
    method contratarUnMensajero(unMensajero) {
        mensajeros.add(unMensajero)
    }

    method despedirUnMensajero(unMensajero){
        mensajeros.remove(unMensajero)
    }

    method despedirATodos() {
        mensajeros.clear()
    }

    method agregarListaDeMensajeros(listaMensajeros){
        mensajeros.addAll(listaMensajeros)
    }

    method eliminarListaDeMensajeros(listaMensajeros){
        mensajeros.removeAll(listaMensajeros)
    }

    method esGrande(){
        return mensajeros.size() > 2
    }

    method puedeSerEntregadoPorElPrimerMensajero(unPaquete){
        return unPaquete.puedeSerEntregado(self.primerEmpleado())
    }

    method primerEmpleado() = mensajeros.first()

    method pesoDelUltimoMensajero() {
        return self.ultimoEmpleado().pesoTotal()
    }

    method ultimoEmpleado() = mensajeros.last()

    method algunEmpleadoPuedeEntregar(unPaquete){
        return mensajeros.any({m => unPaquete.puedeSerEntregado(m)})
    }

    method empleadosQuePuedenEntregar(unPaquete){
        return mensajeros.filter({m => unPaquete.puedeSerEntregado(m)})
    }
    method totalPeso(){
        return mensajeros.sum({ m => m.pesoTotal() })
    } 

    method tieneSobrepeso() {
        return (self.totalPeso() / mensajeros.size()) > 500
}
}

