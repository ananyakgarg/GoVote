//
//  ParentView.swift
//  Connect2Vote
//
//  Created by Ananya Garg on 10/22/22.
//

import SwiftUI

struct ParentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage{
        case .signUpPage:
            Sign_Up_View()
        case .rideSchedulePage:
            RideScheduleView()
        case .orgChoiceView:
            OrgChoiceView()
        case .confirmationView:
            ConfirmationView()
        }
       
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView().environmentObject(ViewRouter())
    }
}
