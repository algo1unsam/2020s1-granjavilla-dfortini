import wollok.game.*
import hector.*

class Maiz {

	var property etapa = etapaBebe
	var property position

	method image() {
		return etapa.image()
	}

	method sembrarDondeEsta(granjero) {
		position = granjero.position()
		game.addVisual(self)
	}

	method regar() {
		etapa.cambiarEtapa(self)
	}

}

class Trigo {

	var etapa = 0
	var property position

	method image() {
		return "wheat_" + etapa + ".png"
	}

	method sembrarDondeEsta(granjero) {
		position = granjero.position()
		game.addVisual(self)
	}

	method regar() {
		etapa = (etapa + 1) % 4
	}

}

class Tomaco {

	var property position

	method image() {
		return "tomaco.png"
	}

	method sembrarDondeEsta(granjero) {
		position = granjero.position()
		game.addVisual(self)
	}

	// cuando llega al borde de arriba, ya no hace mas nada
	method regar() {
		game.removeVisual(self)
		position = game.at(position.x(), 9.min(position.y() + 1))
		game.addVisual(self)
	}

}

object etapaBebe {

	method image() = "corn_baby.png"

	method cambiarEtapa(cultivo) {
		cultivo.etapa(etapaAdulto)
	}

}

object etapaAdulto {

	method image() = "corn_adult.png"

	method cambiarEtapa(cultivo) {
	// no hay cambios
	}

}

