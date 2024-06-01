class Vagon {
	method cantidadDePasajeros() = 0
	method esDePasajeros(){
		return self.cantidadDePasajeros() > 0
	}
	method recibirMantenimiento(){}
	method esPopular() = self.cantidadDePasajeros() > 50
}

class VagonDePasajeros inherits Vagon {
	const largo
	const ancho
	const tieneBanios
	var estaOrdenado
	
	override method cantidadDePasajeros() = 
		if(ancho <= 3) {8 * largo} else {10 * largo} - if(estaOrdenado) 0 else 15
		
	method carga() = if(tieneBanios) 300 else 800
	
	method pesoMaximo() = 2000 + 80 * self.cantidadDePasajeros() + self.carga()
	
	override method recibirMantenimiento() {
		estaOrdenado = true
	}
}

class VagonDeCarga inherits Vagon{
	const cargaMaximaIdeal
	var maderasSueltas
	
	method carga() = cargaMaximaIdeal - 400 * maderasSueltas
	
	method tieneBanios() = false
	
	method pesoMaximo() = 1500 + self.carga()
	override method esPopular() = false
	override method recibirMantenimiento() {
		maderasSueltas = 0.max(maderasSueltas - 2)
	}
}

class VagonDormitorio inherits Vagon{
	const cantidadDeCompartimientos
	var camasPorCompartimiento
	
	override method cantidadDePasajeros() = cantidadDeCompartimientos * camasPorCompartimiento
	method tieneBanios() = true	
	method carga() = 1200
	method pesoMaximo() = 4000 + 80 * self.cantidadDePasajeros() + self.carga()
}