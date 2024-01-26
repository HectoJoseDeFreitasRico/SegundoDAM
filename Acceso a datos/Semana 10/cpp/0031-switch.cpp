#include <iostream>
using namespace std;


int main(){
	int diadelasemana = 1;
	switch(diadelasemana){
		case 1:
			cout << "Hoy es una depresion\n";
			break;
		case 2:
			cout << "Sigo triste\n";
			break;
		case 3:
			cout << "Estamos a mitad de semana\n";
			break;
		case 4:
			cout << "Hoy es un buen dia\n";
			break;
		case 5:
			cout << "La segunda venida de jesucristo\n";
			break;
		case 6:
			cout << "La tercera venida de jesucristo\n";
			break;
		case 7:
			cout << "Felicidad y depresion\n";
			break;
		default:
			cout << "Lo que pusiste no es un dia de la semana";
	}
	
	return 0;
}