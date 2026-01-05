//
//  ProfileHeaderView.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack (spacing:16) {
            VStack  (spacing : 8){
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                
                Text("Giorgi Gotsadze")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
            
            
        }
    }
}

#Preview {
    ProfileHeaderView()
}
