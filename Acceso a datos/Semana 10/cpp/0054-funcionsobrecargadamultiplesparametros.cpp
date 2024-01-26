#include <iostream>
using namespace std;



string saluda(string nombre,int edad){
	return "Hola, " + nombre + ", tu edad es de " + to_string(edad) + " y yo te saludo \n";
}

string saluda(string nombre){
	return "Hola, " + nombre + ", yo te saludo \n";
}

string saluda(){
	return "Hola, yo te saludo \n";
}

int main(){
	
	cout << saluda("Luis");
	cout << saluda("Manuel");
	cout << saluda("Ana");
	cout << saluda();
	cout << saluda("Gabi",16);
	
	return 0;
}
