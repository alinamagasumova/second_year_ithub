from collections import deque

class Queue:
    def __init__(self):
        self._queue = deque()

    def enqueue(self, el):
        self._queue.append(el)

    def dequeue(self):
        return self._queue.popleft()


nine = Queue()
ten = Queue()
eleven = Queue()
sortArr = ['9 Ali 15,6', '10 Kali 15,4', '11 Dali 15']

i = 0
while (i<len(sortArr)):
    if (sortArr[i][0] == 9):
        nine.enqueue(sortArr[i])
    elif (sortArr[i][0] == 1 and sortArr[i][1] == 0):
        ten.enqueue(sortArr[i])
    elif (sortArr[i][0] == 1 and sortArr[i][1] == 1):
        eleven.enqueue(sortArr[i])
    i+=1


firstMan = Queue()
SecondMan = Queue()

firstCol = [0, 1, 2, 3, 4]
secCol = [5, 6, 7 ,8 , 9]

