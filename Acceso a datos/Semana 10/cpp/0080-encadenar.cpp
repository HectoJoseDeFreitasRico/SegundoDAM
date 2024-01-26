#include <iostream>
#include <string>
using namespace std;


int main(){
	string nombre = "Manolo";
	string apellidos = "Martinez Marti";
	string retorno = "\n";
	string nombrecompleto = nombre+" "+apellidos+retorno;
	cout << nombrecompleto;
	return 0;
}