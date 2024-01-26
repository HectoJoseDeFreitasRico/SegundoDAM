#include <iostream>
using namespace std;

class Persona{
	private:
		double altura;
	public:
		string nombre;
		int edad;
		void ponAltura(double alt){
			altura = alt;
		}
		double dameAltura(){
			return altura;
		}
};


int main(){
	Persona persona1;
	persona1.nombre = "luis";
	persona1.ponAltura(1.78);
	cout << persona1.dameAltura();
	
	return 0;
}