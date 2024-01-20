#include <iostream>
using namespace std;


int main(){
	int longitud = 20;
	string agenda[longitud][3];
	agenda[0][0] = "Luis";
	agenda[0][1] = "6481875";
	agenda[0][2] = "email1@email.com";
	
	agenda[1][0] = "Lorenzo";
	agenda[1][1] = "65165165";
	agenda[1][2] = "email2@email.com";
	
	agenda[2][0] = "Luisa";
	agenda[2][1] = "651849";
	agenda[2][2] = "email3@email.com";
	
	for(int i = 0;i<longitud;i++){
		cout << "nombre: " << agenda[i][0] << " - telefono: " << agenda[i][1] << " - email: " << agenda[i][2] << "\n";
	}
	
	return 0;
}