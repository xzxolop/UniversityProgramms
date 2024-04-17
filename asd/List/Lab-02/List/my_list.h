#include <initializer_list>
#include <memory>
#include <iterator>
#include <iostream>
#include <stdexcept>

template<typename T, typename Allocator = std::allocator<T>>
class List {
private:
	struct node {
		T data;
		node* next;
		node* prev;
		node(const T& d, node* p, node* n) : data(d), prev(p), next(n) {}
		node(T&& d, node* p, node* n) : data(std::move(d)), prev(p), next(n) {}
	};

	using value_type = T;
	using iterator_category = std::input_iterator_tag;
	using pointer = value_type*;
	using reference = value_type&;
	using difference_type = std::ptrdiff_t;
	using const_pointer = const pointer;
	using const_reference = const reference;

	template<typename Pointer, typename Reference>
	class Iterator : public std::iterator<std::bidirectional_iterator_tag, value_type, difference_type, Pointer, Reference> {
	public:
		// пять юзингов неявно появятся из-за наследования

		friend class List; // у класса лист теперь есть доступ к закрытым полям итератора.

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
	using const_iterator = Iterator<const_pointer, const_reference>;
	using reverse_iterator = std::reverse_iterator<iterator>;
	using const_reverse_iterator = std::reverse_iterator<const_iterator>;

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
	node* create_node(T&& elem, node* prev, node* next) { // для чего тут prev/next?
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

	// служебная функция для удаления элемента.
	void remove_node(node* temp) {
		if (temp == fictive_node) throw new std::out_of_range("list is empty");
		temp->prev->next = temp->next;
		temp->next->prev = temp->prev;
		delete_node(temp);
		_size--;
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

	List(const std::initializer_list<T>& il) : List() { // как оно раньше работало без :List()?
		for (auto x : il) {
			push_back(x);
		}
	}

	explicit List(int size) : List() {
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

	void push_back(T&& value) {
		node* newNode = create_node(std::move(value), fictive_node->prev, fictive_node);
		fictive_node->prev->next = newNode; // перепресваивание указателя с фиктивной вершины на новый эл-ет.
		fictive_node->prev = newNode;
		_size++;
	}

	void pop_back() {
		remove_node(fictive_node->prev);
	}

	void push_front(const T& value) {
		push_front(std::move(T(value)));
	}

	void push_front(T&& value) {
		node* newNode = create_node(std::move(value), fictive_node, fictive_node->next);
		fictive_node->next->prev = newNode; // перепресваивание указателя с фиктивной вершины на новый эл-ет.
		fictive_node->next = newNode;
		_size++;
	}

	void pop_front() {
		remove_node(fictive_node->next);
	}

	iterator erase(iterator position) { // ??
		++position;
		remove_node(position.p->prev);
		return position;
	}

	iterator erase(const_iterator position) {
		++position;
		remove_node(position.p->prev);
		return position;
	}

	iterator erase(const_iterator first, const_iterator last) {
		node* left = first.p->prev;
		node* temp = first.p;
		while (temp != last.p) {
			temp = temp->next;
			remove_node(temp->prev);
		}
		left->next = last.p;
		last.p->prev = left;

		return last;
	}

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

	const_iterator cbegin() { // real const ?
		return const_iterator(fictive_node->next);
	}

	const_iterator cend() {
		return const_iterator(fictive_node);
	}

	const_iterator begin() const { // fake const ?
		return const_iterator(fictive_node->next);
	}

	const_iterator end() const {
		return const_iterator(fictive_node);
	}

	reverse_iterator rbegin() noexcept {
		return reverse_iterator(end());
	}
	const_reverse_iterator rbegin() const noexcept {
		return const_reverse_iterator(cend());
	}
	const_reverse_iterator crbegin() const noexcept {
		return const_reverse_iterator(cend());
	}
	reverse_iterator rend() noexcept {
		return reverse_iterator(begin());
	}
	const_reverse_iterator rend() const noexcept {
		return const_reverse_iterator(cbegin());
	}
	const_reverse_iterator crend() const noexcept {
		return const_reverse_iterator(cbegin());
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






/*
template<typename T>
class MyList
{
public:
    using value_type      = T;
    using size_type       = size_t;
    using difference_type = ptrdiff_t;
    using pointer         = value_type*;
    using const_pointer   = const value_type*;
    using reference       = value_type&;
    using const_reference = const value_type&;

    template<typename Pointer, typename Reference>
    class BaseIterator : public std::iterator<std::bidirectional_iterator_tag, value_type, difference_type, Pointer, Reference>
    {
    public:
        bool operator==(const BaseIterator& other);
        bool operator!=(const BaseIterator& other);
        pointer operator->();
        BaseIterator& operator--();
        BaseIterator& operator--(int);
        BaseIterator& operator++();
        BaseIterator& operator++(int);
        Reference operator*();
    };

    using iterator               = BaseIterator<pointer, reference>;
    using const_iterator         = BaseIterator<const_pointer, const_reference>;
    using reverse_iterator       = std::reverse_iterator<iterator>;
    using const_reverse_iterator = std::reverse_iterator<const_iterator>;

    MyList();
    MyList(const MyList& other);
    MyList(MyList&& other);
    MyList(std::initializer_list<T> init);

    MyList& operator=(const MyList& other);
    MyList& operator=(MyList&& other) noexcept;
    MyList& operator=(std::initializer_list<T> ilist);

    reference front();
    const_reference front() const;
    reference back();
    const_reference back() const;

    iterator begin() noexcept;
    const_iterator begin() const noexcept;
    const_iterator cbegin() const noexcept;
    iterator end() noexcept;
    const_iterator end() const noexcept;
    const_iterator cend() const noexcept;

    reverse_iterator rbegin() noexcept;
    const_reverse_iterator rbegin() const noexcept;
    const_reverse_iterator crbegin() const noexcept;
    reverse_iterator rend() noexcept;
    const_reverse_iterator rend() const noexcept;
    const_reverse_iterator crend() const noexcept;

    bool empty() const noexcept;
    size_type size() const noexcept;

    void clear() noexcept;

    iterator insert(const_iterator pos, const T& value);
    iterator insert(const_iterator pos, T&& value);

    iterator erase(iterator pos);
    iterator erase(const_iterator pos);
    iterator erase(iterator first, iterator last);
    iterator erase(const_iterator first, const_iterator last);

    void push_back(const T& value);
    void push_back(T&& value);
    void pop_back();
    void push_front(const T& value);
    void push_front(T&& value);
    void pop_front();

    void swap(MyList& other) noexcept;

    void reverse() noexcept;

    ~MyList();
};
*/