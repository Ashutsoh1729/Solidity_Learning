// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Struct allows us to create related data
// You can define in different file and import into your contract

contract Todos {
    constructor() {}

    struct Todo {
        string text;
        bool completed;
    }

    // When you define your struct you have to define your array
    // All the data you are going to create using struct are going to stored in an array

    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 Ways to initialize a struct
        // - calling it Like a function
        todos.push(Todo(_text, false));

        // 2nd method
        // Key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        //todo.completed initialized to false

        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // You don't actually need this function.

    function get(
        uint _index
    ) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // Update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // Update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
