//


//  ContentView.swift
//  uitest
//
//  Created by Cheng-En Yew on 5/18/23.
//

import Foundation
import SwiftUI
import SQLite





struct ContentView: SwiftUI.View
{
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false

    
    var body: some SwiftUI.View
    {
        ZStack
        {
            VStack(spacing: 20)
            {
                Text("ZotNutrition")
                    .font(.system(size: 24))
                    .offset(x: 0, y:-200)
            }
            NavigationView
            {
                VStack()
                {
                    HStack
                    {
                        Text("Username: ")
                        TextField("Username", text: $username)
                    }
                    .padding()
                    
                    HStack
                    {
                        Text("Password:  ")
                        SecureField("Password", text: $password)
                    }.padding()
                    VStack(spacing: 10)
                    {
                        Button("Log In", action: {
                            isLoggedIn = DatabaseManager.shared.LogIn(username: username, password: password)
                            print(isLoggedIn)
                        })
                        
                        NavigationLink(destination: ZNProfileSetUp())
                        {
                            Text("Register")
                        }
                    }.padding()
                        .offset(x: 0, y: 35)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some SwiftUI.View
    {
        ContentView()
    }
}

