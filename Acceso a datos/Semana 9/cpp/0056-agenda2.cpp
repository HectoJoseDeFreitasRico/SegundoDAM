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
	//Guardo la opcion del ususario
	string opcion;
	//Muestro el menu inicial al usuario
	system("cls"); //Limpiar la pantalla
	cout << "Programa agenda v.001 por Hector\n";
	cout << "Escoge una opcion\n";
	cout << "1.-Introducir un registro\n";
	cout << "2.-Listar registros\n";
	cin >> opcion;
	cout << "Has elegido la opcion: " << opcion << "\n";
	if(opcion == "1"){
		cout << "Vamos a insertar un nuevo registro\n";
	}else if(opcion == "2"){
		cout << "Vamos a listar los elementos de la agenda\n";
	}else{
		cout << "Eso no es una opcion";
	}
	
	return 0;
}