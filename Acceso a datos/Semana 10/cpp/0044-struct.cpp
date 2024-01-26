#include <iostream>
using namespace std;


int main(){
	struct{
		string nombre;
		int telefono;
		string email;
	}registro1,registro2;
	
	registro1.nombre = "Manolo";
	registro1.telefono = 61548792;
	registro1.email = "email@email.com";
	
	cout << registro1.nombre << "\n";
	
	
	return 0;
}