#ifndef VORONIN_LIB_H_
#define VORONIN_LIB_H_

#include <functional>
#include <iostream>
#include <variant>
#include <concepts>
#include <ostream>
#include <stack>
#include <queue>

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
	myvector() = default;

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
			for (size_t i = number.size() - 1; i >= 0; i--) {
				std::cout << number[i];
			}
			std::cout << std::endl;
		}
	}

	size_t size() const {
		return number.size();
	}

	char operator[](int i) const {
		return number[i];
	}

private:
	std::vector<char> number;
};

// List with fictive node
template<typename T, typename Allocator = std::allocator<T>>
class List {
private:
	struct node {
		T data;
		node* next;
		node* prev;
		node(T d, node* p, node* n) : data(d), prev(p), next(n) {}
	};

	using value_type = T;
	using iterator_category = std::input_iterator_tag;
	using pointer = value_type*;
	using reference = value_type&;
	using difference_type = std::ptrdiff_t;

	template<typename Pointer, typename Reference>
	class Iterator : public std::iterator<std::bidirectional_iterator_tag, value_type, difference_type, Pointer, Reference> {
	public:
		// пять юзингов неявно появятся из-за наследования

		Iterator(node* pp) : p(pp) {}

		Reference operator*() { return p->data; } // ? возвращаем по ссылке чтобы можно было написать *(l) = 10. можно изменить

		Iterator& operator++() {
			p = p->next;
			return *this;
		}

		Iterator operator++(int) { // тут нельзя вернуть ссылку из-за удаления it, и сслыка станет битой
			Iterator it = *this; // нужно передавать по значению, т.к. иначе будет ссылка, и мы вернём уже увеличенный it (нарушается идея, постфиксного инкремента)
			p = p->next;
			return it;
		}

		Iterator& operator--() {
			p = p->prev;
			return *this;
		}

		Iterator operator--(int) {
			Iterator it = *this;
			p = p->prev;
			return it;
		}

		friend bool operator==(const Iterator& iter1, const Iterator& iter2) {
			return iter1.p == iter2.p;
		}

		friend bool operator!=(const Iterator& iter1, const Iterator& iter2) {
			return !(iter1 == iter2);
		}

	private:
		node* p;
	};

	using iterator = Iterator<pointer, reference>;

	node* fictive_node; // in standart realisation of microsoft and gcc list zakolcovan
	size_t _size;

	using AllocType = typename std::allocator_traits<Allocator>::template rebind_alloc<node>;
	AllocType Alloc;

	node* create_fictive_node() {
		// Выделение памяти
		node* new_fictive_node = Alloc.allocate(1);

		// Инициализация полей кроме data
		// С помощью аллокатора Alloc создаёт по адрессу new_fictive_node->prev (а это node), а затем передаём конструктор объект fictive_node
		std::allocator_traits<AllocType>::construct(Alloc, &(new_fictive_node->prev), new_fictive_node);
		std::allocator_traits<AllocType>::construct(Alloc, &(new_fictive_node->next), new_fictive_node);
		return new_fictive_node;
	}

	node* create_node(const T& elem, node* prev, node* next) {
		return create_node(std::move(T(elem)), prev, next); // переиспользование кода
	}

	// Для типа elem из тестов
	node* create_node(const T&& elem, node* prev, node* next) { // для чего тут prev/next?
		node* node = Alloc.allocate(1);

		std::allocator_traits<AllocType>::construct(Alloc, &(node->prev), prev);
		std::allocator_traits<AllocType>::construct(Alloc, &(node->next), next);
		std::allocator_traits<AllocType>::construct(Alloc, &(node->data), std::move(elem));
		return node;
	}

	void delete_fictive_node(node* fictive_node) {
		std::allocator_traits<AllocType>::destroy(Alloc, &(fictive_node->prev));
		std::allocator_traits<AllocType>::destroy(Alloc, &(fictive_node->next));
		std::allocator_traits<AllocType>::deallocate(Alloc, fictive_node, 1);
	}

	void delete_node(node* node) {
		std::allocator_traits<AllocType>::destroy(Alloc, &(node->data));
		delete_fictive_node(node);
	}



public:
	//List() = default;
	List() : fictive_node(create_fictive_node()), _size(0) {};

	List(const List& other) : List(other.begin(), other.end()) {};

	List(List&& other) : fictive_node(other.fictive_node), _size(other.head) {
		other.fictive_node = nullptr;
		std::swap(Alloc, other.Alloc);
		other._size = 0;
	}

	List(const std::initializer_list<T>& il) : List() { // как оно раньше работало без :List()
		for (auto x : il) {
			push_back(x);
		}
	}

	explicit List(int size): List() {
		while (size > 0) {
			push_back(T());
			size--;
		}
	}

	template<typename iter>
	List(iter begin, iter end) : List() {
		while (begin != end) {
			push_back(*begin);
			++begin;
		}
	}

	void push_back(const T& value) {
		push_back(std::move(T(value)));
	}

	void push_back(const T&& value) {
		node* newNode = create_node(std::move(value), fictive_node->prev, fictive_node);
		fictive_node->prev->next = newNode; // перепресваивание указателя с фиктивной вершины на новый эл-ет.
		fictive_node->prev = newNode;
		_size++;
	}

	void pop_back() {
		if (is_empty()) throw new std::out_of_range("list is empty");
		node* temp = fictive_node->prev;
		temp->prev->next = temp->next;
		temp->next->prev = temp->prev;
		delete_node(temp);
		_size--;
	}

	/*void push_front(T elem) {
		node* newNode = new node(elem, nullptr, head);
		if (head != nullptr) {
			head->prev = newNode;
			head = head->prev;
		}
		else {
			head = tail = newNode;
		}
		_size++;
	}

	void pop_front() {
		if (head == nullptr) return; 
		node* temp = head;
		head = head->next;
		if (head != nullptr) {
			head->prev = nullptr;
		}
		else {
			tail = nullptr;
		}
		delete temp;
		_size--;
	}*/

	size_t size() const noexcept {
		return _size;
	}

	bool is_empty() const noexcept {
		return _size == 0;
	}

	void clear() noexcept {
		while (!is_empty()) { // не будет ли потери производительности из-за вызова функций?
			this->pop_back();
		}
	}

	void print() const {
		node* n = fictive_node->next;
		while (n != fictive_node)
		{
			std::cout << n->data << ' ';
			n = n->next;
		}
		std::cout << std::endl;
	}

	iterator begin() {
		return iterator(fictive_node->next);
	}

	iterator end() {
		return iterator(fictive_node);
	}

	T& operator[](int n) {
		if (n + 1 > _size) {
			throw std::invalid_argument("Index out of range");
		}
		node* elem = fictive_node->next;
		while (n > 0) {
			elem = elem->next;
			n--;
		}
		  
		return elem->data;
	}

	~List() {
		if (fictive_node != nullptr) {
			clear();
			delete_fictive_node(fictive_node);
		}
	}
};

#endif VORONIN_LIB_H_