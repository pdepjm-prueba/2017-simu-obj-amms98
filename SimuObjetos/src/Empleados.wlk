class Empleado{
	var stamina=10
	var tareas=#{}
	var rol=null
	method stamina()=stamina
	method comer(fruta){
		stamina+=fruta.staminaRecuperada()
	}
	method cansarse(staminaUsada){
		stamina-=staminaUsada
	}
	method cambiarRol(_rol){
		rol=_rol
	}

	method experiencia()=tareas.size()*tareas.sum({tarea=>tarea.dificultad()})
	
	method realizarTarea(tarea){
		tarea.trabajar(self)
		tareas.add(tarea)
	}
	method tieneStaminaSuficiente(_stamina)=stamina>=_stamina
	
	method tieneHerramientasNecesarias(herramientas)=rol.tieneHerramientasNecesarias(herramientas)
	
	method esMucama()=rol.EsMucama()
	
	method fuerza()=(stamina/2+2+self.fuerzaExtra())*self.factorFuerza()
	method fuerzaExtra()=rol.fuerzaExtra()
	method factorFuerza()=1
	
	method defender()=rol.defender(self)
	
	method perderMitadStamina(){
		stamina/=2
	}
	
	method factorDificultad()=1
	
	method limpiar(tipoSector){
		rol.limpiar(tipoSector)
	}

}
class Biclope inherits Empleado{
	var staminaMax=10
	override method comer(fruta){
		stamina=staminaMax.min(stamina+=fruta.staminaRecuperada())
	}
}
class Ciclope inherits Empleado{
	override method factorFuerza()=1/2
	override method factorDificultad()=2
}

//
