//
//  LuckyBallView.swift
//  BlissBubble
//
//  Created by Quang Minh Nguyen on 12/5/2024.
//

import SwiftUI

struct LuckyBall: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width:250)
                .foregroundColor(.black)
            Circle()
                .frame(width:150)
                .foregroundColor(.white)
                .padding([.leading, .top],40)
            Text("8")
                .font(.system(size: 70))
                .padding([.leading, .top],46)
        }
    }
}


#Preview {
    LuckyBall()
}
