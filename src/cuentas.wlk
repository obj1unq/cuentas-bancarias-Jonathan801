
object cuentaPepe{
	var saldo=0
	method saldo(){
		return saldo
	}
	method depositar(unaCantidadPesos){
		saldo+=unaCantidadPesos
	}
	method extraer(unaCantidadPesos){
		if(self.saldo()>unaCantidadPesos){
		saldo-=unaCantidadPesos
	    }
    }	
}
object cuentaJulian{
	var saldo=0
	method saldo(){
		return saldo
	}
	method depositar(unaCantidadPesos){
		saldo+=unaCantidadPesos*0.8
	}
	method extraer(unaCantidadPesos){
		if(self.saldo()>unaCantidadPesos+5){
		saldo-=unaCantidadPesos+5
	    }
    }
}
object cuentaDelPadre{
	var saldo=0
	var dolarVenta=15.10
	var dolarCompra=14.70
	method saldo(){
		return saldo*14.70
	}
	method depositar(unaCantidadPesos){
		saldo+=unaCantidadPesos/self.valorDolarVenta()
	}
	method extraer(unaCantidadPesos){
		if(self.saldo()>unaCantidadPesos/self.valorDolarCompra()){
		saldo-=unaCantidadPesos/self.valorDolarCompra()
	    }
    }
    method valorDolarVenta(){
    	return dolarVenta
    }
    method valorDolarCompra(){
    	return dolarCompra
    }
    method actualiarValorDolarCompra(nuevoValor){
    	dolarCompra=nuevoValor
    }
    method actualiarValorDolarVenta(nuevoValor){
    	dolarVenta=nuevoValor
    }
}
object casa{
	var gastos=0
	var cuentaQuePaga=cuentaPepe
	var ultimaCompra = cama
	var comproComida=false
	method gastar(importe){
		cuentaQuePaga.extraer(importe)
		gastos+=importe
	}
	method comprar(cosa){
		self.gastar(cosa.precio())
		ultimaCompra=cosa
		if(cosa.esComida()){
			comproComida=true
		}
	}
	method derrochona(){
		return gastos>5000
	}
	method bacan(){
		return (cuentaQuePaga.saldo()>40000)
	}
	method vieneDeEquiparse(){
		return ultimaCompra.esElectrodomestico()or ultimaCompra.precio()>5000
	}
	method puedeComprar(cosa){
	    return cuentaQuePaga.saldo()>=cosa.precio()
	}
	method cuentaParaGastos(){
		return cuentaQuePaga
	}
	method tieneComida(){
		return comproComida
	}
}
object cuentaCombinada{
	var cuentaPrimaria=cuentaPepe
	var cuentaSecundaria=cuentaJulian
	method saldo(){
		return cuentaPrimaria.saldo()+cuentaSecundaria.saldo()
	}
	method depositar(unaCantidadPesos){
       if(cuentaSecundaria.saldo()<1000){
       	    cuentaSecundaria.depositar(unaCantidadPesos)
       }else{
       	 cuentaPrimaria.depositar(unaCantidadPesos)
       }
	}
	method extraer(unaCantidadPesos){
		if(unaCantidadPesos<cuentaPrimaria.saldo()){
			cuentaPrimaria.extraer(unaCantidadPesos)
		}else{
			cuentaSecundaria.extraer(unaCantidadPesos-cuentaPrimaria.saldo())
			cuentaPrimaria.extraer(cuentaPrimaria.saldo())
		}
    }
	
}
//guia 3 continuacion
object heladera{
    method precio() = 20000
    method esComida() = false
    method esElectrodomestico()= true
}
object cama{
    method precio() = 8000
    method esComida() = false
    method esElectrodomestico()= false
}
object tiraDeAsado{
    method precio() = 350
    method esComida() = true
    method esElectrodomestico()= false
}
object fideos{
    method precio() = 50
    method esComida() = true
    method esElectrodomestico()= false
}
object plancha{
    method precio() = 1200
    method esComida() = false
    method esElectrodomestico()= true
}
