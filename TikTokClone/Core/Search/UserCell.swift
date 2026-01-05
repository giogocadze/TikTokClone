//
//  UserCell.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack (spacing : 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width : 48, height :48)
                .foregroundStyle(Color(.systemGray5))
            
            
            VStack (alignment: .leading){
                Text("User")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("User")
                    .font(.footnote)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
