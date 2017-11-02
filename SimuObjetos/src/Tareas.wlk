class Tarea{
	method puedeTrabajar(empleado)
	
	method prodecimiento(empleado)
	
	method trabajar(empleado){
		
		if(self.puedeTrabajar(empleado)){
			self.exception()
		}
		else{
			self.prodecimiento(empleado)
		}
	}
	method exception()
	method dificultad(empleado)
}
class ArreglarMaquina inherits Tarea{
	var complejidadMaquina
	var herramientasNecesarias=#{}
	constructor(_complejidadMaquina,_herramientasNecesarias){
		complejidadMaquina=_complejidadMaquina
		herramientasNecesarias=_herramientasNecesarias
	}
	override method exception()=throw new NoPuedeArreglarException()
	override method puedeTrabajar(empleado)=empleado.tieneStaminaSuficiente(complejidadMaquina) and empleado.tieneHerramientasNecesarias(herramientasNecesarias)
	
	override method prodecimiento(empleado){
		empleado.arreglar(complejidadMaquina)
	}
	
	override method dificultad(empleado)=complejidadMaquina
}

class DefenderSector inherits Tarea{
	var gradoAmenaza
	constructor(_gradoAmenaza){
		gradoAmenaza=_gradoAmenaza
	}
	override method exception()=throw new NoPuedeDefenderException()
	override method puedeTrabajar(empleado)=not(empleado.puedeDefender()) and empleado.fuerza()>gradoAmenaza
	
	override method prodecimiento(empleado){
		empleado.defender()
	}
	
	override method dificultad(empleado)=gradoAmenaza*empleado.factorDificultad()
}

class LimpiarSector inherits Tarea{	
	var dificultad=10
	var tipoSector=null
	constructor (_tipoSector){
		tipoSector=_tipoSector
	}
	override method exception()=throw new NoPuedeLimpiarException()
	method cambiarDificultar(_dificultad){
		dificultad=_dificultad
	}
	
	override method puedeTrabajar(empleado)=empleado.tieneStaminaSuficiente(tipoSector.StaminaNecesaria())
	
	override method prodecimiento(empleado){
		empleado.limpiar(tipoSector)
	}
	
	override method dificultad(empleado)=dificultad
	
}

class NoPuedeArreglarException inherits Exception{
	
}

class NoPuedeLimpiarException inherits Exception{
	
}
class NoPuedeDefenderException inherits Exception{
	
}

object sectorGrande{
	method staminaNecesaria()=4
}

object otroSector{
	method staminaNecesaria()=1
}
