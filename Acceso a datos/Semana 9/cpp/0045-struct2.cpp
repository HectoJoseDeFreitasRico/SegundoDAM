#include <iostream>
using namespace std;


int main(){
	struct registro{
		string nombre;
		int telefono;
		string email;
	};
	
	registro agenda[20];
	agenda[0].nombre = "Manolo";
	agenda[0].telefono = 55444245;
	agenda[0].email = "email@email.com";
	
	cout << agenda[0].nombre << "\n";
	
	
	return 0;
}