#include <iostream>
using namespace std;


int main(){
	//Defino los datos con los que voy a trabajar
	//Defino la longitud de la agenda
	int longitud = 100;
	// Creo una estructura
	struct registro{
		string nombre;
		int telefono;
		string email;
	};
	//Defino el array de agenda
	registro agenda[longitud];

	cout << "Programa agenda v.001 por Hector\n";
	cout << "Escoge una opcion\n";
	cout << "1.-Introducir un registro\n";
	cout << "2.-Listar registros\n";
	
	
	return 0;
}