//
//  AboutView.swift
//  BlissBubble
//
//  Created by JungWoo Choi on 12/5/2024.
//

import SwiftUI

struct AboutView: View {
    @EnvironmentObject var customBlissBallViewModel: CustomBlissBallViewModel
    var body: some View {
        VStack {
            ZStack {
                CustomBlissBallView()
                    .environmentObject(customBlissBallViewModel)
                    .scaleEffect(0.75)
            }
            Text("BlissBall")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("v1.0")
            Text("Made with ❤️ from the iOSDev team")
            Text("Designed by Quang & the Inter8ctors team - FID")
                .font(Font.system(size: 14))
                .padding(.bottom, 5)
            Text("([Quang Minh](https://github.com/quangmng), [Wende Zhou](https://github.com/MarvelousAlex) & [Jung Woo Choi](https://github.com/cjungwo))")
                .font(Font.system(size: 14))
        }
    }
}

#Preview {
    AboutView().environmentObject(CustomBlissBallViewModel())

}
