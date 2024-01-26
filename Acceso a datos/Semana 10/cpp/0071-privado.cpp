#include <iostream>
using namespace std;

class Persona{
	public:
		string nombre;
		int edad;
	private:
		int altura;
};


int main(){
	Persona persona1;
	persona1.nombre = "luis";
	persona1.altura = 1.78;
	
	return 0;
}