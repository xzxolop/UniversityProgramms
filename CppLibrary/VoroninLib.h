#ifndef VORONIN_LIB_H_
#define VORONIN_LIB_H_

#include<functional>
#include<iostream>

template<typename T>
void print(const std::initializer_list<T>& il) {
	for (auto it = il.begin(); it != il.end(); it++) {
		std::cout << *it << ' ';
	}
	std::cout << std::endl;
}

template<typename C>
void print(const C& cont) {
	auto last = std::prev(cont.end());
	for (auto it = cont.begin(); it != last; it++) {
		std::cout << *it << ", ";
	}
	std::cout << *last << std::endl;
}



#endif VORONIN_LIB_H_