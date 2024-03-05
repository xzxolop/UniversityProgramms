#ifndef VORONIN_LIB_H_
#define VORONIN_LIB_H_

#include <functional>
#include <iostream>
#include <variant>
#include <concepts>
#include <ostream>

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


class binary
{
public:
	binary() = default;

	binary(int size) : number(size) {
		for (int i = 0; i < number.size(); i++) {
			number[i] = '0';
		}
		number[size - 1] = '1';
	}

	binary(const std::string& bin) : number(bin.size()) {
		for (int i = 0; i < bin.size(); i++) {
			number[number.size() - 1 - i] = bin[i];
		}
	}

	void increnemt() {
		for (int i = 0; i < number.size() - 1; i++) {
			if (number[i] == '0') {
				number[i] = '1';
				return;
			}
			else if (number[i] == '1') {
				number[i] = '0';
				if (number[i + 1] == '0') {
					number[i + 1] = '1';
					return;
				}
				if (i + 2 == number.size()) {
					number[i + 1] = '0';
					number.push_back('1');
					return;
				}
			}
		}
	}


	void to_binary(int decNumb) {
		int i = 0;
		number.resize(0);
		while (decNumb > 0) {
			number.push_back((decNumb % 2) + '0'); // '0' тут очень важен
			decNumb /= 2;
			i++;
		}
	}

	void print() const {
		if (number.size() == 0) {
			std::cout << "empty" << std::endl;
		}
		else {
			for (int i = number.size() - 1; i >= 0; i--) {
				std::cout << number[i];
			}
			std::cout << std::endl;
		}
	}

	int size() const {
		return number.size();
	}

	char operator[](int i) const {
		return number[i];
	}

private:
	std::vector<char> number;
};


// List class with fictive root
template<typename T>
class List {
private:
	struct node {
		T data;
		node* next;
		node* prev;
		node(T d) : data(d), next(nullptr), prev(nullptr) {}
		node(T d, node* n, node* p) : data(d), next(n), prev(p) {}
	};

	node* root;
public:

	List() {
		root = new node(T());
	}

	List(const List& lst) {
		root = lst.root;
	}

	List(std::initializer_list<T> il): List() {
		for (auto x : il) {
			push_back(x);
		}
	}

	void push_back(T elem) {
		if (root->next == nullptr) {
			root->next = new node(elem);
			return;
		}

		node* n = root;
		while (n->next != nullptr) {
			n = n->next;
		}
		n->next = new node(elem);
		n->prev = n;
	}

	node* get_root() const {
		return root;
	}
	
	void print() const {
		node* next = root;
		while (next != nullptr)
		{
			std::cout << next->data << ' ';
			next = next->next;
		}
		std::cout << std::endl;
	}

	friend std::ostream& operator<<(std::ostream& os, const List& l) {
		node* next = l.root;
		while (next != nullptr)
		{
			os << next->data << ' ';
			next = next->next;
		}
		return os;
	}
	
	
};



template<typename T>
class Tree {
private:
	void prefix_help(Tree* root) const {
		if (root == nullptr) return;
		std::cout << root->Data << ' ';
		prefix_help(root->Left);
		prefix_help(root->Right);
	}

public:
	T Data;
	Tree* Left;
	Tree* Right;

	Tree() {
		Data = T();
		Left = nullptr;
		Right = nullptr;
	}

	Tree(Tree& other) {
		Data = other.Data;
		Left = other.Left;
		Right = other.Right;
	}

	Tree(T data): Data(data), Left(nullptr), Right(nullptr) {}

	void insert(Tree<T>* n) {
		if (n->Data < Data) {
			if (Left == nullptr) {
				Left = n;
			} 
			else {
				Left->insert(n);
			}
		}
		else if (n->Data > Data) {
			if (Right == nullptr) {
				Right = n;
			}
			else {
				Right->insert(n);
			}
		}
	}

	void print_prefix() {
		prefix_help(this);
	}

	friend std::ostream& operator<<(std::ostream& os, Tree& t) {

		os << t.Data;
		return os;
	}
};




#endif VORONIN_LIB_H_