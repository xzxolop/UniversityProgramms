#include "VoroninLib.h"
#include <iostream>

int main() {
	
	List<int> l;
	l.push_front(8);
	l.push_front(3);
	l.print();
	l.pop_front();
	l.pop_front();
	l.pop_front();
	l.print();
	

	


	return 0;
}