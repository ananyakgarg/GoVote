//
//  Sign-Up-View.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/22/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct Sign_Up_View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



struct Sign_Up_View_Previews: PreviewProvider {
    static var previews: some View {
        Sign_Up_View().environmentObject(ViewRouter())
    }
}
