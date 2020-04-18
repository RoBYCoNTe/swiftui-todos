//
//  UserData.swift
//  ToDos
//
//  Created by Roberto Conte Rosito on 18/04/2020.
//  Copyright © 2020 Roberto Conte Rosito. All rights reserved.
//

import Foundation

var sampleData = [
    ToDo(title: "Buy Beacons", content: "Specs of the beacons", priority: true),
    ToDo(title: "Test Beacons", content: "Test beacons with iOS/Android"),
    ToDo(title: "Test BLE GATT", content: "Test the GATT infrastructure with BLE."),
    ToDo(title: "Get some rest", content: "Get holidays please.")
]

final class UserData : ObservableObject {
    @Published var todo: [ToDo]
    
    init(todo: [ToDo] = []) {
        self.todo = todo
    }
}
