package com.example;

import java.util.ArrayList;

public class MyStack<T> {

    private ArrayList<T> data;

    public MyStack() {
        data = new ArrayList<>();
    }

    public void push(T element) {
        data.add(element);
    }

    public T pop() {
        if (data.isEmpty()) {
            return null;
        }
        return data.remove(data.size() - 1);
    }

    public boolean isEmpty() {
        return data.isEmpty();
    }
}
