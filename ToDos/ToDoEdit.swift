//
//  ToDoEdit.swift
//  ToDos
//
//  Created by Roberto Conte Rosito on 18/04/2020.
//  Copyright © 2020 Roberto Conte Rosito. All rights reserved.
//

import SwiftUI

struct ToDoEdit: View {
    @EnvironmentObject var userData : UserData
    
    @State var title: String
    @State var content: String
    @State var priority: Bool
    @State var error: Bool = false
    
    var item: ToDo
    
    init(item: ToDo) {
        self.item = item
        self._title = State(initialValue: item.title)
        self._content = State(initialValue: item.content)
        self._priority = State(initialValue: item.priority)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Title").font(.headline)
            TextField(
                "Title",
                text: $title,
                onEditingChanged: {_ in 
                    self.update()
                }
            )
            Divider()
            Text("Content").font(.headline)
            MultilineTextField(
                text: $content,
                onEditingChange: {
                    print ("New text=\(self.content)")
                    self.update()
                }
            ).padding(-4)
            Divider()
            Spacer()
        }
        .padding(20)
        .navigationBarTitle(Text("Edit ToDo"))
        .navigationBarItems(trailing: Button(action: {
            self.priority.toggle()
            self.update()
        }, label: {
            if priority {
                Image(systemName: "star.fill")
            }
            else {
                Image(systemName: "star")
            }
        }))
    }
    func update() {
        guard let index = userData.todo.firstIndex(of: item) else {
            return
        }
        userData.todo[index].title = title
        userData.todo[index].content = content
        userData.todo[index].priority = priority
    }
}

struct ToDoEdit_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ToDoEdit(item: sampleData[0]).environmentObject(UserData())
        }
    }
}
