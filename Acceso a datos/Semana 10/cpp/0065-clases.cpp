#include <iostream>
using namespace std;

class Persona{
	public:
		string nombre;
		int edad;
};

int main(){
	Persona persona1;
	persona1.nombre = "luis";
	persona1.edad = 38;
	
	Persona persona2;
	persona2.nombre = "Manu";
	persona2.edad = 18;
	
	cout << persona1.nombre << "\n";
	cout << persona2.nombre << "\n";
	
	return 0;
}