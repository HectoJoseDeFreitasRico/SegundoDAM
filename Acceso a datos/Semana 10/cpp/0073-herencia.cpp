#include <iostream>
using namespace std;

class Gato{
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
	
	return 0;
}