//
//  CardHome.swift
//  useeds-app
//
//  Created by Dicky Buwono on 27/11/21.
//

import SwiftUI

struct CardHome: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text("Please select your")
                .font(.system(size: 18))
            Text("PLANTS")
                .font(.system(size: 18, weight: .semibold))
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width/1.2, height: 130, alignment: .center)
        .background(Color("Blue3"))
        .cornerRadius(32)
    }
}

struct CardHome_Previews: PreviewProvider {
    static var previews: some View {
        CardHome()
            .previewLayout(.sizeThatFits)
    }
}
