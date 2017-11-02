class Tarea{
	method puedeTrabajar(empleado)
	
	method prodecimiento(empleado)
	
	method trabajar(empleado){
		
		if(self.puedeTrabajar(empleado)){
			throw new NoCumpleConCondicionParaTrabajarException()
		}
		else{
			self.prodecimiento(empleado)
		}
	}
}
class ArreglarMaquina inherits Tarea{
	var complejidadMaquina
	var herramientasNecesarias=#{}
	constructor(_complejidadMaquina,_herramientasNecesarias){
		complejidadMaquina=_complejidadMaquina
		herramientasNecesarias=_herramientasNecesarias
	}
	override method puedeTrabajar(empleado)=empleado.tieneStaminaSuficiente(complejidadMaquina) and empleado.tieneHerramientasNecesarias(herramientasNecesarias)
	
	override method prodecimiento(empleado){
		empleado.cansarse(complejidadMaquina)
	}
	
	method dificultad(empleado)=complejidadMaquina
}

class DefenderSector inherits Tarea{
	var gradoAmenaza
	constructor(_gradoAmenaza){
		gradoAmenaza=_gradoAmenaza
	}
	override method puedeTrabajar(empleado)=not(empleado.esMucama()) and empleado.fuerza()>gradoAmenaza
	
	override method prodecimiento(empleado){
		empleado.defender()
	}
	
	method dificultad(empleado)=gradoAmenaza*empleado.factorDificultad()
}

class LimpiarSector inherits Tarea{
	var dificultad=10
	var tipoSector=null
	constructor (_tipoSector){
		tipoSector=_tipoSector
	}
	
	method cambiarDificultar(_dificultad){
		dificultad=_dificultad
	}
	
	override method puedeTrabajar(empleado)=empleado.tieneStaminaSuficiente(tipoSector.StaminaNecesaria())
	
	override method prodecimiento(empleado){
		empleado.limpiar(tipoSector)
	}
	
	method dificultad(empleado)=dificultad
	
}

class NoCumpleConCondicionParaTrabajarException inherits Exception{
	
}

object sectorGrande{
	method staminaNecesaria()=4
}

object otroSector{
	method staminaNecesaria()=1
}
