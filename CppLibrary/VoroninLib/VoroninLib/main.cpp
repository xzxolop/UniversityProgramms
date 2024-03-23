#include "VoroninLib.h"
#include <iostream>

int main() {
	
	List<int> l{1, 2, 3, 4};
	auto it = l.begin();
	auto g = it++;
	
	std::cout << *it++ << std::endl;

	


	return 0;
}