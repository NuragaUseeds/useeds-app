//
//  ProfileTabItem.swift
//  useeds-app
//
//  Created by Dicky Buwono on 29/11/21.
//

import SwiftUI

struct ProfileTabItem: View {
    @ObservedObject var viewModel = CustomerViewModel()
    let item = ["Account", "Notification", "Change Language", "Privacy & Policy", "Rate This App", "Help Center", "About"]

    init() {
        UITableView.appearance().backgroundColor = UIColor(Color.clear)
        UITableView.appearance().separatorColor = UIColor(Color.clear)
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    var body: some View {
        ZStack(alignment: .top) {
            Image("ProfileBg")
                .frame(width: UIScreen.main.bounds.width)
            VStack {
                Text("Profile")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.top, 40)
                    .padding(.bottom, 50)
                VStack(spacing: 10) {
                    RemoteImageView(url:URL(fileURLWithPath: viewModel.photo), placeholder: {
                        Image(systemName:"placeholder").frame(width: 40)
                    }) {
                        $0.scaledToFit().clipShape(Circle())
                    }
                    Text(viewModel.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    Button {
                        
                    }label: {
                        Text("Edit Profile")
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                    }
                }
                Spacer(minLength: 20)
                ScrollView(showsIndicators: false) {
                    ForEach(item, id: \.self) { item in
                        HStack(spacing: 10) {
                            Image(systemName: "pencil")
                            Text(item)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    }
                }.padding()
                    Button {
                        
                    }label: {
                        Text("Logout")
                            .foregroundColor(.red)
                            .font(.system(size: 17, weight: .bold))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(Color.red)
                            
                    ).padding(.horizontal)
            }.padding()
        }.edgesIgnoringSafeArea(.top)
        
    }
}

struct ProfileTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabItem()
    }
}
