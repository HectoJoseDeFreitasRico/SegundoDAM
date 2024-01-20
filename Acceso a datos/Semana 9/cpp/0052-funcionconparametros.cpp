#include <iostream>
using namespace std;



string saluda(string nombre){
	return "Hola, " + nombre + ", yo te saludo \n";
}

int main(){
	
	cout << saluda("Luis");
	cout << saluda("Manuel");
	cout << saluda("Ana");
	cout << saluda();
	cout << saluda("Gabi");
	
	return 0;
}
