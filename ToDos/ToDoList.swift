//
//  ToDoList.swift
//  ToDos
//
//  Created by Roberto Conte Rosito on 18/04/2020.
//  Copyright © 2020 Roberto Conte Rosito. All rights reserved.
//

import SwiftUI

struct ToDoList: View {
    @EnvironmentObject var userData : UserData
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: add) {
                        Text("Add ToDo")
                    }
                }
                Section {
                    ForEach(userData.todo, id: \.id) { item in
                        NavigationLink(destination: ToDoEdit(item: item)) {
                            ToDoRow(item: item)
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle("My ToDos")
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    
    }
    
    func add() {
        userData.todo.append(ToDo(title: "New ToDo", content: "TODO: "))
    }
    func delete(at offset: IndexSet) {
        userData.todo.remove(atOffsets: offset)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        userData.todo.move(fromOffsets: source, toOffset: destination)
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList().environmentObject(UserData(todo: sampleData))
    }
}
