#include <stdio.h>

int sumar(int op1,int op2){
	int operador1 = op1;
	int operador2 = op2;
	int suma = operador1 + operador2;
	return suma;
}

int main(int argc,char *argv[]){
	printf("La suma es: %i \n",sumar(4,3));
	printf("La suma es: %i \n",sumar(54,3));
	printf("La suma es: %i \n",sumar(8,3));
	
	return 0;
}

