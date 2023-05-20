
import SwiftUI

func submit() -> Bool
{
    return true
}

struct ZNProfileSetUp: View
{
    @State var houseSelection: String = "1"
    @State var sexSelect: String = "1"
    @State var heightSelect1: String = "1"
    @State var heightSelect2: String = "0"
    @State var weight: String = ""
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                HStack
                {
                    Text("Weight: ").offset(x: 130, y: 0)
                    TextField("Weight", text: $weight)
                        .offset(x: 140, y: 0)
                }
                
                
                HStack{
                    Text("Height (ft, in): ").offset(x: 0, y: 0)
                    Picker(
                        selection: $heightSelect1,
                        label: Text("Feet"),
                        content:
                            {
                                Text("3").tag("3")
                                Text("4").tag("4")
                                Text("5").tag("5")
                                Text("6").tag("6")
                                Text("7").tag("7")
                                Text("8").tag("8")
                                Text("9").tag("9")
                            })
                    Picker(
                        selection: $heightSelect2,
                        label: Text("Inches"),
                        content:
                            {
                                Group
                                {
                                    Text("0").tag("0")
                                    Text("1").tag("1")
                                    Text("2").tag("2")
                                    Text("3").tag("3")
                                }
                                
                                Group
                                {
                                    Text("4").tag("4")
                                    Text("5").tag("5")
                                    Text("6").tag("6")
                                    Text("7").tag("7")
                                }
                                
                                Group
                                {
                                    Text("8").tag("8")
                                    Text("9").tag("9")
                                    Text("10").tag("10")
                                    Text("11").tag("11")
                                    Text("12").tag("12")
                                }
                            })
                }
                HStack
                {
                    Text("Sex: ")
                    Picker(
                        selection: $sexSelect,
                        label: Text("Sex"),
                        content:
                            {
                                Text("Male").tag("1")
                                Text("Female").tag("2")
                            })
                }
                
                
                HStack
                {
                    Text("Housing Community: ")
                    Picker(
                        selection: $houseSelection,
                        label: Text("Housing"),
                        content:
                            {
                                Text("Arroyo Vista").tag("1")
                                Text("Camino Del Sol").tag("2")
                                Text("Plaza Verde").tag("3")
                                Text("Puerta Del Sol").tag("4")
                                Text("University Town Center").tag("5")
                                Text("Vista Del Campo").tag("6")
                                Text("Vista Del Campo Norte").tag("7")
                                
                            })
                }
                NavigationLink(destination: ZNGoalsPage())
                {
                    Text("Submit")
                }
                /*Button("Submit",action:
                        {
                            let res = submit()
                            print(res)
                }).offset(x:0,y:50)*/
            }
        }
        
    }
}

    
struct ZNProfileSetUp_Previews: PreviewProvider {
    static var previews: some View {
        ZNProfileSetUp()
    }
}
