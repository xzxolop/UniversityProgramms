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
void print(const C& conteiner) {
	for (auto x : conteiner) {
		std::cout << x << ' ';
	}
	std::cout << std::endl;
}



#endif VORONIN_LIB_H_