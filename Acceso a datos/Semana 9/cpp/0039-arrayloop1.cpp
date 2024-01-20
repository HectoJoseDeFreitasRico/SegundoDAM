#include <iostream>
using namespace std;


int main(){
	int longitud = 20;
	string agenda[longitud];
	agenda[0] = "Luis";
	agenda[1] = "Gutierrez";
	agenda[2] = "Lorenzo";
	agenda[3] = "Manolo";
	
	for(int i = 0;i<longitud;i++){
		cout << "Elemento en la agenda: " << agenda[i] << "\n";
	}
	
	return 0;
}