import vagones.*

class Formacion {
	const property vagones = []
	const locomotoras = []
	
	method agregarVagon(unVagon) {
		vagones.add(unVagon)
	}
	method desarmarFormacion() {
		vagones.clear()
		locomotoras.clear()
	}
	
	method cuantosPasajerosPuedeLlevar() = vagones.sum({v=>v.cantidadDePasajeros()})
	method cantidadVagonesPopulares() = vagones.count({v=>v.esPopular()})
	method esFormacionCarguera() = vagones.all({v=>v.carga()>1000})
	method vagonMasPesado() = vagones.max({v=>v.pesoMaximo()})
	method vagonMasLiviano() = vagones.min({v=>v.pesoMaximo()})
	method dispersionDePesos() = self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo()
	method cantidadDeBanios() = vagones.count({v=>v.tieneBanios()})
	
	method hacerMantenimiento() {
		vagones.forEach({v=>v.recibirMantenimiento()})
	}
	method vagonesConPasajeros() = vagones.filter({v=>v.cantidadDePasajeros()>0})
	method vagonConMasPasajeros() = self.vagonesConPasajeros().max({v=>v.cantidadDePasajeros()})
	method vagonConMenosPasajeros() = self.vagonesConPasajeros().min({v=>v.cantidadDePasajeros()})
	method estaEquilibrada() = 
		self.vagonConMasPasajeros().cantidadDePasajeros() - self.vagonConMenosPasajeros().cantidadDePasajeros() <= 20
	
	method estaOrganizada() {
		if (vagones.size()>=2) {
			return not (1..vagones.size()-1).any({i=> not vagones.get(i-1).esDePasajeros() and vagones.get(i).esDePasajeros()})
		}
		else {return true}
	}
		
}