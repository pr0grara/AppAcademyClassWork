

export const allTodos = (todos) => {
  return Object.keys(state.todos).map((id) => {
    todos[id]
  })
}

// [{obj1}, {obj2}]

// Object.keys(todos)

// todo[id], todo.id
// Object.keys(todos) = [1,2,3,4,5]

// 1: {
//     id: 1
//     title: sometho
//     aefs: af
// }
// 2: {
//     id: 1
//     title: sometho
//     aefs: af
// }
// 3: {
//     id: 1
//     title: sometho
//     aefs: af
// }