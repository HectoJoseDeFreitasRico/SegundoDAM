#include <iostream>
using namespace std;


int main(){
	int longitud = 20;
	string agenda[longitud];
	agenda[0] = "Luis";
	agenda[1] = "Gutierrez";
	agenda[2] = "Lorenzo";
	agenda[3] = "Manolo";
	
	for(string i : agenda){
		cout << "tengo un elemento en la agenda que es " << i << "\n";
	}
	
	return 0;
}