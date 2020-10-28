
class Integrante {
	
	const armas = #{}
	
	var estaMuerto = false

	method estaDurmiendoConLosPeces() {
		return estaMuerto
	}
	
	method cantidadArmas() {
		return armas.size()
	}
	
	method armarse() {
		self.agregarArma(new Pistola(cantidadBalas = 6))
	}
	
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
}

class Familia {
	
	const integrantes = #{}
	
	method mafiosoMasArmado() {
		return integrantes.max { integrante => integrante.cantidadArmas() }
	}
	
	method armarFamilia() {
		integrantes.forEach { integrante => integrante.armarse() }
	}
}


class Pistola {
	var cantidadBalas
}