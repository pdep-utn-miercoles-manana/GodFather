class Integrante {

	const armas = [new Escopeta()]
	
	var estaHerido = false
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
		return armas.any{ arma => arma.esSutil() }
	}

	method atacarFamilia(unaFamilia) {
		const atacado = unaFamilia.mafiosoMasPeligroso()
		if (atacado.estaVivo()) {
			self.atacar(atacado)
		}
	}

	method estaVivo() {
		return not estaMuerto
	}

	method atacar(unaPersona) {
		rango.atacar(self, unaPersona)
	}

	method armaCualquiera() {
		return armas.anyOne()
	}

	method armaMasCercana() {
		return armas.first()
	}
	
	method morir() {
		estaMuerto = true
	}
	
	method herir() {
		if (estaHerido) {
			self.morir()
		} else {
			estaHerido = true
		}
	}

}

class Familia {

	const integrantes = #{}

	method mafiosoMasPeligroso() {
		return self.integrantesVivos().max{ integrante => integrante.cantidadArmas() }
	}

	method armarFamilia() {
		self.integrantesVivos().forEach{ integrante => integrante.armarse()}
	}

	method atacarFamilia(unaFamilia) {
		self.integrantesVivos().forEach{ integrante => integrante.atacarFamilia(unaFamilia)}
	}
	
	method integrantesVivos() {
		return integrantes.filter { integrante => integrante.estaVivo() }
	}

}

class Revolver {

	var cantidadBalas

	method esSutil() {
		return cantidadBalas == 1
	}

	method usarContra(unaPersona) {
		if (self.estaCargada()) {
			unaPersona.morir()
			cantidadBalas--			
		}
	}
	
	method estaCargada() {
		return cantidadBalas > 0
	}

}

class CuerdaDePiano {

	const esDeBuenaCalidad

	method esSutil() {
		return true
	}
	
	method usarContra(unaPersona) {
		if (esDeBuenaCalidad) {
			unaPersona.morir()			
		}
	}

}

class Escopeta {

	method esSutil() {
		return false
	}

	method usarContra(unaPersona) {
		unaPersona.herir()
	}

}

class Don {

	const subordinados = #{}

	method sabeDespacharElegantemente(unaPersona) {
		return true
	}

	method atacar(unAtacante, unAtacado) {
		subordinados.anyOne().atacar(unAtacado)
	}

}

class Subjefe {

	const subordinados = #{}

	method sabeDespacharElegantemente(unaPersona) {
		return subordinados.any{ subordinado => subordinado.tieneArmaSutil() }
	}

	method atacar(unAtacante, unAtacado) {
		unAtacante.armaCualquiera().usarContra(unAtacado)
	}

}

class Soldado {

	method sabeDespacharElegantemente(unaPersona) {
		return unaPersona.tieneArmaSutil()
	}

	method atacar(unAtacante, unAtacado) {
		unAtacante.armaMasCercana().usarContra(unAtacado)
	}

}

object donCorleone inherits Don {	
	override method atacar(unAtacante, unAtacado) {
		super(unAtacante, unAtacado)
		super(unAtacante, unAtacado)
	}
}
