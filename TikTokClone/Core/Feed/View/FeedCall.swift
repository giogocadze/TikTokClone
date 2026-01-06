//
//  FeedCall.swift
//  TikTokClone
//
//  Created by giorgi gotsadze on 1/5/26.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post : Post
    var body: some View {
        ZStack {
            if let url = URL(string: post.videoUrl) {
                VideoPlayer(player: AVPlayer(url: url))
                    .containerRelativeFrame([.horizontal, .vertical])
            }

            VStack {
                Spacer()
                HStack (alignment : .bottom ) {
                    VStack (alignment : .leading){
                        Text("giorgi gotsdzeuudiasjdiuasdjias")
                           
                            .fontWeight(.semibold)
                        
                        Text("Some Description")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    Spacer()
                    
                    VStack (spacing : 28) {
                       Circle()
                            .frame(width : 48 , height: 48)
                            .foregroundColor(.gray)
                        VStack {
                            Button {
                        
                            } label: {
                                Image(systemName : "heart.fill")
                                    .resizable()
                                    .frame(width : 28,  height:25 )
                                    .foregroundColor(.white)
                            }
                            Text("26")
                                .font(.caption)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        VStack {
                            Button {
                                
                            } label: {
                                Image(systemName : "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width : 28,  height:25 )
                                    .foregroundColor(.white)
                            }
                            Text("27")
                                .font(.caption)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        
                        
                        Button {
    
                            
                        } label: {
                            Image(systemName : "bookmark.fill")
                                .resizable()
                                .frame(width : 22,  height:25 )
                                .foregroundColor(.white)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName : "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width : 28,  height:25 )
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.bottom, 85)
            }
            .padding()
        }
       
    }
}

#Preview {
    FeedCell(
        post: Post(
            id: UUID().uuidString,
            videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        )
    )
}
