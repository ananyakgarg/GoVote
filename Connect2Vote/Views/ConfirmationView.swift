//
//  ConfirmationView.swift
//  GoVote
//
//  Created by Sarayu Yenumula on 10/22/22.
//

import SwiftUI

struct ConfirmationView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {

        ZStack
        {
            Color(red: 0, green: 0, blue: 0)
                .ignoresSafeArea()
            Rectangle()
                .fill(Color(red: 1, green: 0, blue: 0.898))
                .frame(width: 400, height: 400)
                .position(x: 200, y: 20)
            Text("Confirmation for Ride")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .position(x:200, y: 25)
            Image("ec249a5345e8e27732ff471032fe2c31")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .clipShape(Circle())
                .frame(width: 190, height: 190)
                .position(x:200, y: 170)
    
            Text("Lisa Cain")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .position(x:200, y: 300)
            Text("Organization: League of Women Voters")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .position(x: 200, y: 330)
            Text("License Number: NC-DBD1454")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .position(x: 200, y: 350)
            Text("Address of Pickup Spot: 55 Winding Pine Trail, Cary NC")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .position(x: 200, y: 440)
            Text("Time & Date of Ride: Oct 23 1:00pm")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .position(x: 200, y: 400)
            Button(action: {
                viewRouter.currentPage = .rideSchedulePage
                    print("create bubble tapped")
                }) {
                    Text("Confirm")
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
                .position(x: 200, y: 700)
            
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
