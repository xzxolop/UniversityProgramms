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

// List with two fictive nodes
template<typename T>
class List {
private:
	struct node {
		T data;
		node* next;
		node* prev;
		node(T d) : data(d), next(nullptr), prev(nullptr) {}
		node(T d, node* p, node* n) : data(d), prev(p), next(n) {}
	};

	node* head, * tail; // in standart realisation of microsoft and gcc list zakolcovan
	size_t _size;

public:
	List() : head(nullptr), tail(nullptr), _size(0) {}

	List(const List& other) {}

	List(List&& other) : head(other.head), tail(other.head), _size(other.head) {
		other.head = nullptr;
		other.tail = nullptr;
		other._size = 0;
	}

	List(const std::initializer_list<T>& il) {
		for (auto x : il) {
			push_back(x);
		}
	}

	void push_back(const T& value) {
		node* newNode = new node(value, tail, nullptr);
		if (tail != nullptr) {
			tail->next = newNode;
			tail = newNode;
		}
		else {
			head = tail = newNode;
		}
	}

	void print() const {
		node* n = head;
		while (n != nullptr)
		{
			std::cout << n->data << ' ';
			n = n->next;
		}
		std::cout << std::endl;
	}

	~List() {}
};


template<typename T>
class Tree {
	struct Node {
		Node* parent;
		T data;
		Node* left;
		Node* right;

		Node(Node* parent, const T& data, Node* left = nullptr, Node* right = nullptr) : parent(parent), data(data), left(left), right(right) {}

		Node(Node* parent, T&& data, Node* left = nullptr, Node* right = nullptr) : parent(parent), data(std::move(data)), left(left), right(right) {}

		Node(const T& val) : parent(nullptr), data(val), left(nullptr), right(nullptr) {}

		Node(T&& val) : parent(nullptr), data(std::move(val)), left(nullptr), right(nullptr) {}

		friend std::ostream& operator<<(std::ostream& os, Node& n) {
			return os << n.data;
		}
	};

private:
	Node* root;

	void setChild(Node* parent, Node* node, Node* child) {
		if (parent) {
			if (parent->right == node)
				parent->right = child;
			else
				parent->left = child;
		}
		else
			root = child;
		delete node;
	}

	void LKP_helper(Node* node) {
		if (!node)
			return;
		LKP_helper(node->left);
		std::cout <<* node << " ";
		LKP_helper(node->right);
	}

	void setMin(Node* node) {
		while (node->left)
			node = node->left;
	}

	bool Equal_helper(const Node* r1, const Node* r2) {
		return (r1 && r2) ? (r1->data == r2->data && Equal_helper(r1->left, r2->left) && Equal_helper(r1->right, r2->right)) : (!r1 && !r2);
	}

public:
	Tree() :root(nullptr) {}
	Tree(const Tree& other) : root(other.root) {}
	Tree(Tree&& other) : Tree() {
		std::swap(other.root, root);
	}

	class Iterator {
	public:
		using iterator_category = std::forward_iterator_tag;
		using value_type = T;
		using difference_type = std::ptrdiff_t;
		using pointer = T*;
		using reference = T&;

		Iterator(Node* node) : current(node) {}

		reference operator*() {
			return current->data;
		}

		pointer operator->() {
			return &current->data;
		}

		Iterator& operator++() {
			if (current == nullptr) {
				return *this;
			}

			if (current->left) {
				current = current->left;
			}
			else if (current->right) {
				current = current->right;
			}
			else {
				Node* parent = current->parent;
				while (parent != nullptr && (parent->right == current || parent->right == nullptr)) {
					current = parent;
					parent = parent->parent;
				}
				if (parent == nullptr) {
					current = nullptr;
				}
				else {
					current = parent->right;
				}
			}
			return *this;
		}

		bool operator==(const Iterator& other) const {
			return current == other.current;
		}

		bool operator!=(const Iterator& other) const {
			return !(*this == other);
		}

	private:
		Node* current;
	};

	Iterator begin() {
		return Iterator(root);
	}

	Iterator end() {
		return Iterator(nullptr);
	}

	void insert(T&& data) {
		if (!root) {
			root = new Node(std::move(data));
			return;
		}
		Node* node = root;
		while (node) {
			if (data < node->data) {
				if (node->left)
					node = node->left;
				else {
					node->left = new Node(node, std::move(data));
					break;
				}
			}
			else if (data > node->data) {
				if (node->right)
					node = node->right;
				else {
					node->right = new Node(node, std::move(data));
					break;
				}
			}
			else
				break;
		}
	}

	void insert(const T& data) {
		insert(std::move(T(data)));
	}

	Node* find(const T& data) {
		Node* node = root;
		while (node) {
			if (data < node->data) {
				if (node->left)
					node = node->left;
				else {
					return nullptr;
				}
			}
			else {
				if (data > node->data) {
					if (node->right)
						node = node->right;
					else {
						return nullptr;
					}
				}
				else {
					return node;
				}
			}
		}
		return node;
	}

	Node* findMax() {
		Node* node = root;
		while (node->right)
			node = node->right;
		return node;
	}

	Node* findMin() {
		Node* node = root;
		while (node->left)
			node = node->left;
		return node;
	}

	Node* Bound_upper(T data) {
		Node* res = nullptr;
		Node* cur = root;
		while (cur) {
			if (cur->data >= data) {
				res = cur;
				cur = cur->left;
			}
			else {
				cur = cur->right;
			}

		}
		return res;
	}

	Node* Bound_lower(T data) {
		Node* res = nullptr;
		Node* cur = root;
		while (cur) {
			if (cur->data <=
				data) {
				res = cur;
				cur = cur->right;
			}
			else
				cur = cur->left;
		}
		return res;
	}

	void deleteEl(T data) {
		Node* node = find(data);
		if (!node)
			return;
		Node* parent = node->parent;
		if (!node->right) {
			setChild(parent, node, node->left);

		}
		else {
			if (!node->left && node->right) {
				setChild(parent, node, node->right);
			}
			else {
				Node* change = node->left;
				while (change->right)
					change = change->right;
				std::swap(node->data, change->data);
				if (change->right)
					setChild(change->parent, change, change->right);
				else
					setChild(change->parent, change, change->left);
			}
		}
	}

	void LKP_print() {
		Node* cur = root;
		LKP_helper(cur);
		std::cout << std::endl;
	}

	void PKL_print() {
		Node* cur = root;
		std::stack<Node*> st;
		std::stack<Node*> out;

		while (cur || !st.empty()) {
			while (cur) {
				st.push(cur);
				out.push(cur);
				cur = cur->right;
			}
			cur = st.top();
			st.pop();
			cur = cur->left;
		}

		while (!out.empty()) {
			std::cout << out.top()->data << " ";
			out.pop();
		}

		std::cout << std::endl;
	}

	void Layers_print() {
		Node* cur = root;
		std::queue<Node*> q;
		q.push(cur);
		while (!q.empty()) {
			cur = q.front();
			q.pop();
			std::cout <<* cur << " ";
			if (cur->left)
				q.push(cur->left);
			if (cur->right)
				q.push(cur->right);
		}
		std::cout << std::endl;
	}

	bool operator==(Tree& tree) {
		Node* r1 = root;
		Node* r2 = tree.root;
		return Equal_helper(r1, r2);
	}

	Node* next(Node* node) {
		Node* cur = node->right;
		if (cur) {
			while (cur->left)
				cur = cur->left;
		}
		else {
			T data = node->data;
			cur = node->parent;
			while (data > cur->data)
				cur = cur->parent;
		}
		return cur;
	}

	Node* previous(Node* node) {
		if (node != nullptr) {
			Node* cur = node->left;
			if (cur) {
				while (cur->right)
					cur = cur->right;
			}
			else {
				T data = node->data;
				cur = node->parent;
				while (data < cur->data)
					cur = cur->parent;
			}
			return cur;
		}
		return nullptr;
	}

	Iterator next(const Iterator& iter) const {
		Node* node = iter.current;
		if (node->right) {
			return Iterator(node->right);
		}
		else {
			Node* parent = node->parent;
			while (parent != nullptr && parent->right == node) {
				node = parent;
				parent = parent->parent;
			}
			if (parent == nullptr) {
				return Iterator(nullptr);
			}
			else {
				return Iterator(parent->right);
			}
		}
	}

	Iterator previous(const Iterator& iter) const {
		Node* node = iter.current;
		if (node->left) {
			Node* cur = node->left;
			while (cur->right) {
				cur = cur->right;
			}
			return Iterator(cur);
		}
		else {
			Node* parent = node->parent;
			while (parent != nullptr && parent->left == node) {
				node = parent;
				parent = parent->parent;
			}
			if (parent == nullptr) {
				return Iterator(nullptr);
			}
			else {
				return Iterator(parent);
			}
		}
	}
};




#endif VORONIN_LIB_H_