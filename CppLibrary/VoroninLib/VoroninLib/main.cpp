#include "VoroninLib.h"
#include <iostream>
#include <vector>

int main() {
	
	List<int> l {1, 2, 3, 4,6};
	l.print();
	List<int> l2(l.begin(), l.end());
	l2.print();
	


	return 0;
}