#include <iostream>
#include <string>
using namespace std;


int main(){
	string nombre = "Manuel";
	string &referencia = nombre;
	
	
	cout << referencia << "\n";
	
	return 0;
}