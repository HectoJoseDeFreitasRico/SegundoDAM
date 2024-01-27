#include <stdio.h>
#include <string.h>

int main(int argc,char *argv[]){
	char nombre[] = "Luis ";
	char apellidos[] = "Rodriguez Marti";
	
	strcat(nombre,apellidos);
	printf("Mi nombre completo es: %s ",nombre);
	return 0;
}