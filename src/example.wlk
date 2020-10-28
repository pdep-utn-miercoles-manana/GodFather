
class Integrante {
	
	const armas = #{}
	
	var estaHerido
	var estaMuerto
	
	method estaDurmiendoConLosPeces() {
		return estaMuerto
	}
	
	method cantidadArmas() {
		return armas.size()
	}
	
}

class Familia {
	
	const integrantes = #{}
	
	method mafiosoMasArmado() {
		return integrantes.max { integrante => integrante.cantidadArmas() }
	}
	
}

