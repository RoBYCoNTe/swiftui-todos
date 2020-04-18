//
//  ToDoRow.swift
//  ToDos
//
//  Created by Roberto Conte Rosito on 18/04/2020.
//  Copyright © 2020 Roberto Conte Rosito. All rights reserved.
//

import SwiftUI

struct ToDoRow: View {
    @EnvironmentObject var userData : UserData
    var item: ToDo
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(item.title).font(.headline)
                Text(item.shortDescription()).font(.subheadline)
            }
            Spacer()            
            if item.priority {
                Image(systemName: "star.fill")
                    .animation(.easeIn)
            }
            else {
                Image(systemName: "star")
                    .animation(.easeIn)
            }
            
        }
    }
}

struct ToDoRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRow(item: sampleData[0]).environmentObject(UserData())
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
