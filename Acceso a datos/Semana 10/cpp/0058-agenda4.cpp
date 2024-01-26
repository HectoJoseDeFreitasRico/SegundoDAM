#include <iostream>
using namespace std;



int main(){
	//Defino los datos con los que voy a trabajar
	//Defino un cursor para saber la posicion de la agenda
	int cursor = 0;
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
	//Solicito una entrada del usuario
	cin >> opcion;
	cout << "Has elegido la opcion: " << opcion << "\n";
	//Ejecuto la opcion que de el usuario
	if(opcion == "1"){
		cout << "Vamos a insertar un nuevo registro\n";
		cout << "Introduce el nombre de usuario\n";
		string nombre;
		cin >> nombre;
		cout << "Introduce un numero de contacto\n";
		int telefono;
		cin >> telefono;
		cout << "Introduce un email\n";
		string email;
		cin >> email;
		cout << "Voy a introducir " << nombre << "," << telefono << "," << email << "\n";
		agenda[cursor].nombre = nombre;
		agenda[cursor].telefono = telefono;
		agenda[cursor].email = email;
		cursor++;
		cout << "Registros en la agenda:\n";
		for(int i = 0;i<cursor;i++){
			cout << agenda[i].nombre << ", " << agenda[i].telefono << ", " << agenda[i].email << "\n";
		}
		
	}else if(opcion == "2"){
		cout << "Vamos a listar los elementos de la agenda\n";
	}else{
		cout << "Eso no es una opcion";
	}
	
	return 0;
}