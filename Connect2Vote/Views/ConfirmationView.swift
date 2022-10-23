//
//  ConfirmationView.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/23/22.
//

import SwiftUI

struct ConfirmationView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView().environmentObject(ViewRouter())
    
    }
}
