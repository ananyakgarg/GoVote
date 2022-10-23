//
//  OrgChoiceView.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/22/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct OrgChoiceView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var orgs = ""
    var db = Firestore.firestore()
    
    var body: some View {
        ZStack
        {
            Color(red: 0, green: 0, blue: 0)
                .ignoresSafeArea()
            VStack{
                VStack{
                    Text("Preference of Driver Organization")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    Button("ⓘ  click here for more info on the organizations")
                {
                    print("Button tapped!")
                }
                    
                    .foregroundColor(Color.white)
                    .font(.subheadline)
                    .buttonStyle(.bordered)
                    .padding()
                                VStack{
                                    ForEach(viewRouter.orgsLst, id: \.id) {item in HStack{
                                        RadioButtonField(
                                            id: item.name,
                                            label: item.name,
                                            color:.white,
                                            bgColor: Color(red: 1, green: 0, blue: 0.898),
                                            isMarked: $orgs.wrappedValue == item.name ? true : false,
                                            callback: { selected in
                                                self.orgs = selected
                                                print("Selected organization is: \(selected)")
                                            }
                                            
                                        )
                                        .padding()
                                    }
                                }
                                    
    
//                                    RadioButtonField(
//                                        id: "Native American Voting Rights",
//                                        color:.white,
//                                        bgColor: Color(red: 1, green: 0, blue: 0.898),
//                                        isMarked: $orgs.wrappedValue == "Native American Voting Rights" ? true : false,
//                                        callback: { selected in
//                                            self.orgs = selected
//                                            print("Selected organization is: \(selected)")
//                                        }
//                                    )
//                                    .padding()
//
//                                    RadioButtonField(
//                                        id: "Black Voters Matter",
//                                        color:.white,
//                                        bgColor: Color(red: 1, green: 0, blue: 0.898),
//                                        isMarked: $orgs.wrappedValue == "Black Voters Matter" ? true : false,
//                                        callback: { selected in
//                                            self.orgs = selected
//                                            print("Selected organization is: \(selected)")
//                                        }
//                                    )
//                                    .padding()
//                                    RadioButtonField(
//                                        id: "American Civil Liberties Union",
//                                        color:.white,
//                                        bgColor: Color(red: 1, green: 0, blue: 0.898),
//                                        isMarked: $orgs.wrappedValue == "American Civil Liberties Union" ? true : false,
//                                        callback: { selected in
//                                            self.orgs = selected
//                                            print("Selected organization is: \(selected)")
//                                        }
//                                    )
//                                    .padding()
//                                    RadioButtonField(
//                                        id: "NAACP Legal Defense & Education Fund",
//                                        color:.white,
//                                        bgColor: Color(red: 1, green: 0, blue: 0.898),
//                                        isMarked: $orgs.wrappedValue == "NAACP Legal Defense & Education Fund" ? true : false,
//                                        callback: { selected in
//                                            self.orgs = selected
//                                            print("Selected organization is: \(selected)")
//                                        }
//                                    )
//                                    .padding()
//                                    RadioButtonField(
//                                        id: "Rock the Vote",
//                                        color:.white,
//                                        bgColor: Color(red: 1, green: 0, blue: 0.898),
//                                        isMarked: $orgs.wrappedValue == "Rock the Vote" ? true : false,
//                                        callback: { selected in
//                                            self.orgs = selected
//                                            print("Selected organization is: \(selected)")
//                                        }
//                                    )
//                                    .padding()
//                                    RadioButtonField(
//                                        id: "Voto Latino",
//                                        color:.white,
//                                        bgColor: Color(red: 1, green: 0, blue: 0.898),
//                                        isMarked: $orgs.wrappedValue == "Voto Latino" ? true : false,
//                                        callback: { selected in
//                                            self.orgs = selected
//                                            print("Selected organization is: \(selected)")
//                                        }
//                                    )
//                                    .padding()
//                                    RadioButtonField(
//                                        id: "Asian Americans Advancing Justice",
//                                        color:.white,
//                                        bgColor: Color(red: 1, green: 0, blue: 0.898),
//                                        isMarked: $orgs.wrappedValue == "Asian Americans Advancing Justice" ? true : false,
//                                        callback: { selected in
//                                            self.orgs = selected
//                                            print("Selected organization is: \(selected)")
//                                        }
//                                    )
                                    .padding()
                                    Spacer()
                                    Button(action: {
                                            print("create bubble tapped")
                                        }) {
                                            Text("Continue")
                                                .frame(minWidth: 0, maxWidth: 200)
                                                .font(.system(size: 18))
                                                .padding()
                                                .foregroundColor(.white)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 25)
                                                        .stroke(Color(red: 1, green: 0, blue: 0.898), lineWidth: 2)
                                            )
                                        }
                                        .background(Color(red: 1, green: 0, blue: 0.898))
                                        .cornerRadius(25)
                                }
                    
                                
                            }
            }
        }
    }
    // Adds available organization's to user's view
    

    
    
    
    
    
}



//MARK:- Radio Button Field
struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let bgColor: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label: String,
        size: CGFloat = 20,
        color: Color = Color.black,
        bgColor: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.bgColor = bgColor
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .clipShape(Circle())
                    .foregroundColor(self.bgColor)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}


struct OrgChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        OrgChoiceView()
    }
}



