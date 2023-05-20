//
//  ContentView.swift
//  ZNGoals
//
//  Created by Cheng-En Yew on 5/19/23.
//

import SwiftUI

func submit(res: String) -> String
{
    print(res)
    return res
}

struct ZNGoalsPage: View {
    @State var goalSelection: String = "1"
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Text("User Goals").offset(x:0,y:-250).font(.system(size:24))
                
                HStack
                {
                    Text("Weight Goals: ").offset(x:0,y:-100)
                    Picker(selection: $goalSelection, label: Text("Weight Goal"),
                           content:
                               {
                                   Text("Lose Weight").tag("1")
                                   Text("Gain Weight").tag("2")
                                   Text("Gain Muscle").tag("3")
                                
                                   
                    }).offset(x:0,y:-100)
                }
                NavigationLink(destination: ZNRecipe()/*Replace Content View with Recipe Selection View*/)
                {
                    Text("Find Recipes For You")
                }
                /*Button("Find Recipes For You",action:
                        {
                    var res = submit(res: goalSelection)
                }).offset(x:0,y:50)*/
                
            }
        }
    }
}

struct ZNGoalsPage_Previews: PreviewProvider {
    static var previews: some View {
        ZNGoalsPage()
    }
}
