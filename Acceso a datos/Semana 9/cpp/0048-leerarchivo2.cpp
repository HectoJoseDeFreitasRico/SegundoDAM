#include <iostream>
#include <fstream>
using namespace std;


int main(){
	string linea;
	ifstream archivo;
	archivo.open("miarchivo2.txt");
	if(archivo.is_open()){
		while(getline(archivo,linea)){
			cout << linea << "\n";
		}
	}else{
		cout << "Error";
	}
	archivo.close();
	
	return 0;
}