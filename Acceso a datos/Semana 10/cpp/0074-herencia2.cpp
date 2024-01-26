#include <iostream>
using namespace std;

class Mamifero{
	public:
		string mama(){
			return "este animal mama cuando es pequenio";
		}
};

class Gato: public Mamifero{
	public:
		string nombre;
		int edad;
		string maulla(){
			return "El gato esta maullando\n";
		}
};


int main(){
	Gato gato1;
	cout << gato1.maulla();
	cout << gato1.mama();
	
	return 0;
}