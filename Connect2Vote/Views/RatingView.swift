//
//  rating page.swift
//  hackduke 2022 sana
//
//  Created by Sana Goyal on 10/22/22.
//

import SwiftUI

struct rating_page: View {
    @EnvironmentObject var viewRouter: ViewRouter

    @State private var rating = 0
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack{
                
                HStack{
                    Text("GoVote")
                    
                        .navigationTitle("wtm")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()
                Text("you have reached your destination!")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    
                
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fill)
                    .frame(width:30, height: 30)
                    .padding()
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 370, height: 350)
                    .position(x:200, y:200)
                
                RatingView(rating: $rating)
                    .position(x:200, y: -70)
                   
                
                Text("Rate your driver")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black)
                    .position(x:200, y: -140)
                
                Button(action: {
                    print("create bubble tapped")
                }) {
                    HStack{
                        
                        Text("Donations?")
                            .frame(minWidth: 0, maxWidth: 200)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 35)
                                    .stroke(Color(red: 1, green: 0, blue: 0.898), lineWidth: 2)
                        )
                    }

                        
                    }
                .background(Color(red: 1, green: 0, blue: 0.898))
                .cornerRadius(35)
                .position(x:200, y: -100)
            }
        }
    }
}

struct rating_page_Previews: PreviewProvider {
    static var previews: some View {
        rating_page()
    }
}
