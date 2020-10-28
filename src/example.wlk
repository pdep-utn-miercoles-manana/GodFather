
class Integrante {
	
	const armas = #{}
	
	var estaMuerto = false
	var rango = new Soldado()

	method estaDurmiendoConLosPeces() {
		return estaMuerto
	}
	
	method cantidadArmas() {
		return armas.size()
	}
	
	method armarse() {
		self.agregarArma(new Revolver(cantidadBalas = 6))
	}
	
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
	method sabeDespacharElegantemente() {
		return rango.sabeDespacharElegantemente(self)
	}
	
	method tieneArmaSutil() {
		return armas.any { arma => arma.esSutil() }
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


class Revolver {
	var cantidadBalas
	
	method esSutil() {
		return cantidadBalas == 1
	}
}

class CuerdaDePiano {
	method esSutil() {
		return true
	}
}

class Escopeta {
	method esSutil() {
		return false
	}
}

class Don {
	method sabeDespacharElegantemente(unaPersona) {
		return true
	}
}

class Subjefe {
	const subordinados = #{}
	
	method sabeDespacharElegantemente(unaPersona) {
		return subordinados.any { subordinado => subordinado.tieneArmaSutil() }
	}
}

class Soldado {
	method sabeDespacharElegantemente(unaPersona) {
		return unaPersona.tieneArmaSutil()
	}
}