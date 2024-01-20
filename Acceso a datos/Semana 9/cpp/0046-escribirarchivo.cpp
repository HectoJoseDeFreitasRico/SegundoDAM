#include <iostream>
#include <fstream>
using namespace std;


int main(){
	ofstream archivo;
	archivo.open("miarchivo.txt");
	archivo << "hola archivo";
	archivo.close();
	
	return 0;
}