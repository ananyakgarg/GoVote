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
    @State var startLoc = ""

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
                // Title for
                HStack{
                    Text("GoVote")
                    
                        .navigationTitle("GoVote")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                }
                Text("Schedule a ride")
                
                    .navigationTitle("Schedule a ride")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(Color(red: 1, green: 0, blue: 0.898))
                Form{
                    Section{
                        DatePicker("Date and Time", selection: $currentTime)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("Desired Start Location", text: $startLoc)
                    TextField("Desired Polling Place", text: $pollLoc)
                }
                
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
                       .frame(minWidth: 0, maxWidth: 200)
                       .font(.system(size: 18))
                       .padding()
                       .foregroundColor(.white)
                       .overlay(
                          RoundedRectangle(cornerRadius: 25)
                              .stroke(Color(red: 1, green: 0, blue: 0.898), lineWidth: 2)
                        )
                       .background(Color(red: 1, green: 0, blue: 0.898))
                       .cornerRadius(25)
                Button(action: {
                                   viewRouter.currentPage = .confirmationView
                    viewRouter.createRide(ride_date: currentTime, ride_startLoc: startLoc, ride_endLoc: pollLoc, ride_completed: false)
                             }){
                                    Text("No preference! Connect me with any org")
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

struct RideScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        RideScheduleView().environmentObject(ViewRouter())
    }
}
