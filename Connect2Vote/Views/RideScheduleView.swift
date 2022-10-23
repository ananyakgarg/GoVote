//
//  RideScheduleView.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/22/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct RideScheduleView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var currentTime = Date()
    var db = Firestore.firestore()
    @State var pollLoc = ""
    var  closedRange = Calendar.current.date(byAdding: .year, value:  -1, to: Date())!
    func formatDate()->  String{
        let components = Calendar.current.dateComponents([.hour,.minute, .day, .month, .year], from: currentTime)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 0
        
        return  "\(day)-\(month)-\(year) (\(hour): \(minute))"
    }
    @State var start_time = Date()
    @State private var isExpanding = false
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                
                HStack{
                    Text("c2v")
                    
                        .navigationTitle("wtm")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                }
                Text("Schedule a ride")
                
                    .navigationTitle("wtm")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color(red: 1, green: 0, blue: 0.898))
                Form{
                    Section{
                        DatePicker("Date and Time", selection: $currentTime)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("Desired Polling Place", text: $pollLoc)
//                    {
//
//                        VStack{
//                            Text("women")
//                        }
////                            List(model.bubbleslist, id: \.id){ bubble in
////                                HStack{
////                                    Image(systemName: "plus.circle.fill")
////                                        .onTapGesture {
////                                            print("button pressed")
////                                            print(bubble.bubble_name)
////                                            //bubbles_selected.append(item.bubble_name)
////                                            bubbles_selected.append(bubble.bubble_name)
//////                                                bubble.isselected.toggle()
//////                                                selectedList.append(bubble.bubble_name)
////                                        }
////
////                                    Text(bubble.bubble_name)
////                                        .frame(maxWidth: .infinity, alignment: .leading)
////
////                            }
////                            }
//
//                        }
//
//                }
//
                
                Text("Our drivers represent organizations that focus on increasing voter turnout.")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                
                Text("Would you like to request a ride from a particular organization to connect and learn more?")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                Button(action: {
                   viewRouter.currentPage = .orgChoiceView
               }){
                    Text("Yes I would love to learn more!")
                    .foregroundColor(Color(red: 1, green: 0, blue: 0.898))
                    .font(.headline)
                    .padding()
                Button(action: {
                                   viewRouter.currentPage = .confirmationView
                    viewRouter.createRide(ride_date: currentTime, ride_endLoc: pollLoc, ride_completed: false)
                             }){
                                    Text("No preference! Connect me with any org")
                    .foregroundColor(Color(red: 1, green: 0, blue: 0.898))
                                    .font(.headline)
                                    .padding()
                
            }
        }
    }

}
        }}

}

struct RideScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        RideScheduleView().environmentObject(ViewRouter())
    }
}
