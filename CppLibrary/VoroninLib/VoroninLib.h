#ifndef VORONIN_LIB_H_
#define VORONIN_LIB_H_

#include <functional>
#include <iostream>
#include <variant>
#include <concepts>

template<typename T>
concept Printable = requires(const T & t) {
	std::cout << t;
};

template<Printable T>
void print(const std::initializer_list<T>& il) {
	for (auto it = il.begin(); it != il.end(); ++it) {
		std::cout << *it << ' ';
	}
	std::cout << std::endl;
}

template<typename C>
void print(const C& cont) {
	auto last = std::prev(cont.end());
	for (auto it = cont.begin(); it != last; ++it) {
		std::cout << *it << ", ";
	}
	std::cout << *last << std::endl;
}

void print_v(const std::variant<int, double, std::string, char>& v) {
	if (std::holds_alternative<int>(v))
		std::cout << get<int>(v);
	else if (std::holds_alternative<double>(v))
		std::cout << get<double>(v);
	else if (std::holds_alternative<std::string>(v))
		std::cout << get<std::string>(v);
	else if (std::holds_alternative<char>(v))
		std::cout << get<char>(v);
}

void print(const std::initializer_list<std::variant<int, double, std::string, char>>& il) {
	auto last = std::prev(il.end());
	for (auto it = il.begin(); it < last; ++it) {
		print_v(*it); std::cout << ", ";
	}

	print_v(*last);
}

template<typename T>
class myvector {
public:
	myvector(int sz) : size(sz) {
		data = new T[size];
		for (int i = 0; i < size; i++) {
			data[i] = T();
		}
	}

	myvector(std::initializer_list<T> il) : size(il.size()) {
		data = new T[size];
		for (int i = 0; i < size; i++) {
			data[i] = *(il.begin() + i);
		}
	}

	myvector(const myvector& v) {
		size = v.size;
		data = new T[size];
		for (int i = 0; i < size; i++) {
			data[i] = v.data[i];
		}
	}

	myvector& operator=(const myvector& v) {
		if (this != &v) {
			delete[] data;
			size = v.size;
			data = new T[size];
			std::copy(v.data, v.data + v.size, data);
			return *this;
		}
		return *this;
	}

	void swap(myvector v) {
		std::swap(data, v.data);
		std::swap(size, v.size);

	}

	myvector() = default;

	myvector(myvector&& v) : myvector() {
		swap(v);
	}

	myvector& operator=(myvector&& v) {
		delete[] data;
		swap(v);
		v.data = nullptr;
		v.size = 0;
		return *this;
	}

	~myvector() {
		if (data) {
			delete[] data;
		}
	}

	int length() const {
		return size;
	}

	void push_back(T el) {
		T* oldData = data;
		data = new T[size + 1];
		std::copy(oldData, oldData + size, data);
		data[size] = el;
		size++;
		delete oldData;
	}

	friend std::ostream& operator<<(std::ostream& os, const myvector& v) {
		for (int i = 0; i < v.length(); i++) {
			os << v.data[i] << ' ';
		}
		return os;
	}

private:
	int size;
	T* data;
};


#endif VORONIN_LIB_H_