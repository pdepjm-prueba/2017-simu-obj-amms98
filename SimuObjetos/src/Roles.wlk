class Rol{
	method tieneHerramientasNecesarias(herramientas)=#{}
	method arreglar(empleado,complejidadMaquina){
		empleado.cansarse(complejidadMaquina)
	}
	method puedeDefender()=true
	method fuerzaExtra()=0
	method defender(empleado,tarea){
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
	override method defender(empleado,tarea){}
	
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
	
	method tareaComoCapataz(empleado,tarea,procedimiento){
		if(self.empleadosCapaces(tarea)==null){
			procedimiento.apply(empleado)
		}
		else{
			tarea.trabajar(self.empleadoMasCapaz(tarea))
		}
	}
	
	override method arreglar(empleado,tarea){
		self.tareaComoCapataz(empleado,tarea,{emp=>emp.cansarse(tarea.dificultad())})
	}
	
	override method defender(empleado,tarea){
		self.tareaComoCapataz(empleado,tarea,{emp=>emp.perderMitadStamina()})
	}
	
	override method limpiar(empleado,tarea){
		self.tareaComoCapataz(empleado,tarea,{emp=>emp.cansarse(tarea.StaminaNecesaria())})
	}
	
}
