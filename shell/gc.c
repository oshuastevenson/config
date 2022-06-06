#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* #include <stdio.h> */
int main(int args, char ** argc){
	char * target;
	char * filename;
	char * command;
	command = malloc(80);
	target = *(argc+1);
	filename = strrchr(target, '/');
	filename += 1;

	sprintf(command, "curl -o %s csapp.cs.cmu.edu/3e/ics3/code/%s", filename, target);
	system(command);
	
	return 0;
}
