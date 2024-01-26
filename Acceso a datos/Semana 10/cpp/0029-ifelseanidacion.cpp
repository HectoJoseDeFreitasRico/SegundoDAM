#include <iostream>
using namespace std;


int main(){
	int edad = 10;
	cout << "inicio el programa\n";
	if(edad < 30){
		if(edad < 20){
			cout << "Eres joven\n";
		}else{
			cout << "Eres mayor\n";
		}
	}else{
		if(edad < 40){
			cout << "Eres muy mayor\n";
		}else{
			cout << "Cuidado la tension\n";
		}
	}
	
	cout << "Continuo con la ejecucion del programa\n";
	
	return 0;
}