#include <iostream>
using namespace std;


int main(){
	
	//Declaracion de variables
	int operando1;
	int operando2;
	int suma;
	//Entrada de datos del usuario
	cout << "Introduce el valor del primer operando \n";
	cin >> operando1;
	cout << "Introduce el valor del segundo operando \n";
	cin >> operando2;
	//Calculos con la informacion que introdujo el usuario
	suma = operando1 + operando2;
	//Sacar resultados por pantalla
	cout << "El valor de la suma es: " << suma << "\n";
	return 0;
}