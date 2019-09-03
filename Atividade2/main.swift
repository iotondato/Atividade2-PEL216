//
//  main.swift
//  Atividade2
//
//  Created by Brenno Tondato de Faria on 18/06/19.
//  Copyright © 2019 Brenno Tondato de Faria. All rights reserved.
//
//  Activity 2 - Linked List, Stack and Queue implementation using OOP comcepts
//
// This activity is part of the activities developed for PEL216 (Scientific Programming) of Master Degree Program of
// Electrical Engineering on FEI (Fundação Educacional Inaciana Pe. Sabóia de Medeiros) - SP, Brazil
//
// This code is licensed under MIT license (see LICENSE file for details)
//


// Esta classe é definida por un tipo genérico T que utiliza o um protocolo Equatable
// Que abilite este novo tipo de dado a utilizar os operadores ==, !=, >=, <=, >,
//
class Node<T: Equatable>{
    var value: T? = nil
    var next: Node? = nil
}

class LinkedList<T: Equatable>{
    var head = Node<T>()
    
    func insert(value: T) {
        if self.head.value == nil {
            self.head.value = value
        } else {
            var lastNode = self.head
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            let newNode = Node<T>()
            newNode.value = value
            lastNode.next = newNode
        }
    }
    
    func remove(value: T) {
        if self.head.value == value {
            self.head = self.head.next!
        }
        if self.head.value != nil {
            var node = self.head
            var previousNode = Node<T>()
            while node.value != value && node.next != nil {
                previousNode = node
                node = node.next!
            }
            if node.value == value {
                if node.next != nil {
                    previousNode.next = node.next
                } else {
                    previousNode.next = nil
                }
            }
        }else{
            print("This List has no more item to remove")
        }
    }
    
    func printAllKeys() {
        var current: Node! = self.head
        print("---------------")
        while current != nil && current.value != nil {
            print("The item is \(current.value!)")
            current = current.next
        }
    }
}

class Stack<T: Equatable>: LinkedList<T>{
    private var top = Node<T>()
    
    override func insert(value: T) {
        if self.head.value == nil {
            self.head.value = value
        } else {
            var lastNode = self.head
            
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            
            let newNode = Node<T>()
            newNode.value = value
            lastNode.next = newNode
            self.top = newNode
        }
    }
    
    override func remove(value: T) {
        if self.head.value != nil {
            var node = self.head
            var previousNode = Node<T>()
            

            while node.next != nil {
                previousNode = node
                node = node.next!
            }
            
            if self.head.next != nil{
                self.top = previousNode
                previousNode.next = nil
            }else{
                self.head.value = nil
                self.head.value = nil
            }
        }else{
            print("This Stack has no more item to remove")
        }
    }
    
    func Top(){
        if top.value == nil{
            print("This Stack has no values")
        }else{
            super.printAllKeys()
            print("And the top list is \(String(describing: self.top.value))")
        }
    }
}

class Queue<T: Equatable>: LinkedList<T> {
    
    override func insert(value: T) {
        
        if self.head.value == nil {
            
            self.head.value = value
        
        } else {
            
            var lastNode = self.head
            
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            
            let newNode = Node<T>()
            
            newNode.value = value
            
            lastNode.next = newNode
            
        }
    }
    
    override func remove(value: T) {
        
        if self.head.value != nil {
            
            let previusNode = Node<T>()

            if self.head.next != nil {
                
                previusNode.next = self.head
                
                self.head = self.head.next!

                previusNode.next = nil
            
            } else {
                self.head.value = nil
            }
        }else{
            print("This List has no item to remove")
        }
    
    }

    
    func Top(){
        if self.head.value == nil{
            print("This Queue has no values")
        }else{
            super.printAllKeys()
            print("And the top list is \(String(describing: self.head.value))")
        }
    }
}

var myList = LinkedList<String>()
var myStack = Stack<String>()
var myQueue = Queue<String>()

let names = ["banana", "Plicles", "azeitonas", "Brenno", "Batata", "Camunhão", "Azul", "Cereja"]

print("========== Stack Tests ==========")
for i in names{
    myStack.insert(value: i)
}
myStack.Top()
print()

for _ in 1...4{
    myStack.remove(value: "Brenno")
    myStack.Top()
    print()
}


print("========== Queue Tests ==========")
for i in names{
    myQueue.insert(value: i)
}
myQueue.Top()
print()

for _ in 1...5{
    myQueue.remove(value: "Brenno")
    myQueue.Top()
    print()
}


