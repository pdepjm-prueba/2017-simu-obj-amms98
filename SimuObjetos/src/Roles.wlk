class Rol{
	method tieneHerramientasNecesarias(herramientas)=#{}
	
	method esMucama()=false
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
	override method esMucama()=true
	override method limpiar(empleado,tipoSector){
	}
}

