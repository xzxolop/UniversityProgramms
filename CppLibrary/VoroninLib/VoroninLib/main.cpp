#include "VoroninLib.h"
#include <iostream>
#include <vector>

int main() {
	
	List<int> l{1, 2};
	l.print();
	l.pop_front();
	l.print();
	l.pop_front();
	l.print();
	l.push_back(10);
	l.push_back(20);
	l.print();


	return 0;
}