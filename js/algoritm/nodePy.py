class Node:
    def __init__(self, data, next = None):
        self.data = data
        self.next = next


class SinglyLinkedList:
    def __init__(self):
        self.head = None

    def iterate(self):
        curr = self.head
        while curr:
            print (curr.data)
            curr = curr.next

    def find(self, data):
        ind = 0;
        curr = self.head
        while curr:
            if curr.data == data:
                print(ind)
            ind +=1
            curr = curr.next
        return -1

    def insert(self, data):
        self.head = Node(data, self.head)

    def insertAfter(self, data, newData):
        curr = self.head
        new = Node(newData, None)
        while curr.next:
            if curr.data == data:
                new.next = curr.next
                curr.next = new
            curr = curr.next

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
                print ("Deleted")
            else:
                prev = curr
                curr = curr.next


A = SinglyLinkedList()
A.insert("First")
A.insert("Second")
A.insert("Third")

A.insertAfter("Third", 90)
# A.iterate()
# A.remove(90)
A.iterate()






