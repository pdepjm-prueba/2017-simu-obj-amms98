class Rol{
	method tieneHerramientasNecesarias(herramientas)=#{}
	method arreglar(empleado,complejidadMaquina){
		empleado.cansarse(complejidadMaquina)
	}
	method puedeDefender()=true
	method fuerzaExtra()=0
	method defender(empleado){
		empleado.perderMitadStamina()
	}
	
	method limpiar(empleado,tipoSector){
		empleado.cansarse(tipoSector.staminaNecesaria())
	}
}

class Soldado inherits Rol{
	var practica=0
	method defender(){
		practica+=1
	}
	method danio()=practica*2
	override method fuerzaExtra()=self.danio()
	override method defender(empleado){}
	
}
class Obrero inherits Rol{
	var herramientas=#{}
	method agregarHerramienta(_herramienta){
		herramientas.add(_herramienta)
	}
	override method tieneHerramientasNecesarias(_herramientas)=_herramientas.all({herramienta=>herramientas.contains(herramienta)})	
}


class Mucama inherits Rol{
	override method puedeDefender()=false
	override method limpiar(empleado,tipoSector){
	}
}

class Capataz inherits Rol{
	var empleados=#{}
	method agregarEmpleados(empleado){
		empleados.add(empleado)
	}
	
	method empleadosCapaces(tarea)=empleados.filter({empleado=>tarea.puedeTrabajar(empleado)})
	method empleadoMasCapaz(tarea)=self.empleadosCapaces(tarea).max({emp=>emp.experiencia()})
	override method arreglar(empleado,tarea){
		if(self.empleadosCapaces(tarea)==null){
			super(empleado,tarea.dificultad())
		}
		else{
			super(self.empleadoMasCapaz(tarea),tarea.dificultad())
			
		}
	}
	override method defender(empleado){
		if(self.mejoresEmpleadosParaTarea(tarea).size()==0){
			tarea.trabajar(empleado)
		}
		else{
			empleado.cansarse(tarea.dificultad())
			
		}
	}
	
}
