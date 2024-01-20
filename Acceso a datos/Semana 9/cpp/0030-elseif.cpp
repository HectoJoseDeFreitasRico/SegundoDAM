#include <iostream>
using namespace std;


int main(){
	string diadelasemana = "lunes";
	if(diadelasemana == "lunes"){
		cout << "Hoy es una depresion\n";
	}else if(diadelasemana == "martes"){
		cout << "Sigo triste\n";
	}else if(diadelasemana == "miercoles"){
		cout << "Estamos a mitad de semana\n";
	}else if(diadelasemana == "jueves"){
		cout << "Hoy es un buen dia\n";
	}else if(diadelasemana == "viernes"){
		cout << "La segunda venida de jesucristo\n";
	}else if(diadelasemana == "sabado"){
		cout << "La tercera venida de jesucristo\n";
	}else if(diadelasemana == "domingo"){
		cout << "Felicidad y depresion\n";
	}else{
		cout << "Lo que pusiste no es un dia de la semana";
	}
	
	return 0;
}