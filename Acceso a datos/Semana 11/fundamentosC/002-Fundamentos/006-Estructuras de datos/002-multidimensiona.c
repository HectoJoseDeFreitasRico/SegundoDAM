#include <stdio.h>

int main(int argc,char *argv[]){
	
	char* agenda[10][4];
	
	agenda[0][0] = "Luis";
	agenda[0][1] = "Martinez Marti";
	agenda[0][2] = "1234560";
	agenda[0][3] = "correo@correo.com";
	
	agenda[1][0] = "Jorge";
	agenda[1][1] = "Lopez Marti";
	agenda[1][2] = "0654321";
	agenda[1][3] = "bbbb@bbb.com";
	
	printf("El correo del segundo registro de la agenda es: %s \n",agenda[0][2]);
	
	return 0;
}