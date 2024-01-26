#include <iostream>
using namespace std;



class Mamifero{
	public:
		string mama(){
			return "este animal mama cuando es pequenio\n";
		}
		string grita(){
			return "este animal esta gritando\n";
		}
};

class Gato: public Mamifero{
	public:
		string nombre;
		int edad;
		string maulla(){
			return "El gato esta maullando\n";
		}
		string grita(){
			return "Este gato esta gritando\n";
		}
};


int main(){
	Gato gato1;
	cout << gato1.maulla();
	cout << gato1.mama();
	cout << gato1.grita();
	
	return 0;
}