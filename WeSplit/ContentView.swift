//
//  ContentView.swift
//  WeSplit
//
//  Created by Devanshi on 19/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = 0
    
    let students = ["Harry", "Hermione", "Ron"]
    
    var body: some View {
// Understanding the basic structure of a SwiftUI app
//        Text("Hello World")
        
// Creating a form
//        Form {
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//        } // Maximum 10 childs

//        Form {
//            Group {
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//            }
//
//            Group {
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//            }
//        }

//        Form {
//            Section {
//                Text("Hello World")
//            }
//
//            Section {
//                Text("Hello World")
//                Text("Hello World")
//            }
//        }

// Adding a navigation bar
//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello World")
//                }
//            }
//            .navigationBarTitle(Text("SwiftUI"))
//            .navigationBarTitle("SwiftUI", displayMode: .inline)
//            .navigationBarTitle("SwiftUI")
//        }
        
// Modifying program state
//        Button("Tap Count: \(tapCount)") {
//            self.tapCount += 1
//        }
        
//Binding state to user interface controls
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
        
//        Form {
//            ForEach(0 ..< 100) {
//                Text("Row \($0)")
//            }
//        }
        
// Creating views in a loop
//        VStack {
//            Picker("Select your student", selection: $selectedStudent) {
//                ForEach(0 ..< students.count) {
//                    Text(self.students[$0])
//                }
//            }
//            Text("You chose: Student # \(students[selectedStudent])")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
