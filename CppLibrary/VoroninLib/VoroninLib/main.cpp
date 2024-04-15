#include "VoroninLib.h"
#include <iostream>
#include <vector>

int main() {
	
	List<int> l{9, 10, 30};
	l.print();
	l.push_back(8);
	l.push_back(80);
	l.print();
	
	//l.print();


	return 0;
}