# класс с узлом односвязного списка
class Node:
    def _init_(self, data, next=None):
        self.data = data
        self.next = next

# печать всего списка = потом как метод класса
def iterate(head):
    elementOut = head
    while elementOut:
        print(elementOut.data)
        elementOut = elementOut.next

# поиск элемента в списке и возвращение его позиции - потом как метод класса
def find(elemFind):
    ind = 0
    elemF = head # первый узел списка
    while elemF:
        if elemF.data == elemFind: print(ind)
        ind += 1
        elemF = elemF.next
    return -1

# создание списка из 4 элементов и ссылок - потом как объект класса SinglyLinkedList

a1 = Node('Голова списка')
a2 = Node('Первый узел')
a3 = Node('Второй узел')
a4 = Node('Хвост', None)
a1.next = a2
a2.next = a3
a3.next = a4

iterate(a1)
head = Node('New head')
head.next = a1
iterate(head)

find('Хвост')
find('Голова списка')

class SinglyLinkedList:

    # голова
    def _init_(self, data, next=None):
        self.head = None

    # печать всего списка
    def iterate(self):
    curr = self.head
    while curr:
        print(curr.data)
        curr = curr.next

    # поиск элемента в списке
    def find(self, data):
    idx = 0
    curr = self.head # первый узел списка
    while curr:
        if curr.data == data: print(idx)
        idx += 1
        curr = curr.next
    return -1

    # добавление узла в голову - указатель нового узла на старую голову
    def insert(self, data):
        self.head = Node(data, self.head)

    # добавление узла после существующего
    def insertAfter(self, data, newData):
        curr = self.head
        new = Node(newData, None)
        while curr.next:
            if curr.data == data:
                new.next = curr.next
                curr.next = new
            curr = curr.next
    
    # удаление узла
    # нужно сохранить указатель из удаленного узла, чтобы, удалив значение, можно было просто изменить указатель
    def remove(self, data):
        if not self.head:
            return None

        while (self.head and self.head.data == data):
            self.head = self.head.next
        
        curr = self.head
        while curr:
            if curr.data == data:
                prev.next = curr.next
                curr = None
                print('Удалили')
            else:
                prev = curr
                curr = curr.next

A = SinglyLinkedList()
A.insert('Хвост')
A.insert('Второй узел')
A.insert('Первый узел')
A.insert('Голова списка')

A.insertAfter('Первый узел', 28)
A.iterate()
A.remove(28)
A.iterate()
