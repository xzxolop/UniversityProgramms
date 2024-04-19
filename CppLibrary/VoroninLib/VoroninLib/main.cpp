#include "VoroninLib.h"
#include <iostream>
#include<list>

int main() {
	
	List<int> l{9, 10, 30};
	l.print();
	l.push_back(8);
	l.push_back(80);
	l.print();
	l.pop_back();
	l.pop_back();
	l.print();
	l.push_back(6);
	l.print();
	l[2] = 90;
	l.print();
	//l.erase(l.begin(), l.end());
	l.erase(l.cbegin(), l.cend());
	l.print();

	List<int> l2 {1, 2, 3, 4, 5};

	l = l2;
	l2.push_back(10);
	l.print();
	l = { 1,2,3 };
	l.print();

	l = std::move(l2);
	l.print();
	l2.print();
	
	



	return 0;
}