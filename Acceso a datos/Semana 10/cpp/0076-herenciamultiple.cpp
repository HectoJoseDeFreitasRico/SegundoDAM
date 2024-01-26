#include <iostream>
using namespace std;

class Deidad{
	public:
		string humanos(){
			return "humanos rendidme pleitesia\n";
		}
};

class Animal{
	public:
		string movimiento(){
			return "Este animal se mueve\n";
		}
};

class Mamifero: public Animal{
	public:
		string mama(){
			return "este animal mama cuando es pequenio\n";
		}
};

class Gato: public Mamifero, public Deidad{
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
	cout << gato1.movimiento();
	cout << gato1.humanos();
	
	return 0;
}