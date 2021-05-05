//
//  Home.swift
//  Mac Pint.
//
//  Created by sergio shaon on 5/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    let screen = NSScreen.main!.visibleFrame
    @State var search = ""
    let layout = [GridItem(.adaptive(minimum: 150))]
    let data = Array(arrayLiteral: Int.random(in: 1..<1000))
   
    var body: some View {
        VStack{
            HStack{
                LeftSideBar()
                Divider()
                    .offset(x: -20)
                    .frame(width: 3)
                Spacer()
                VStack{
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $search)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                    }
                    .padding()
                    .background(BlurView())
                    .cornerRadius(12)
                    // shoing images using lazy grid and internet image downloader
                    GeometryReader { geo in
                        ScrollView{
                            LazyVGrid(columns: layout, spacing: 15 ){
                                // load images to view here
                                ForEach(data, id: \.self) { p in
                                    WebImage(url: URL(string: "https://picsum.photos/id/\(p)/200")!)
                                        .placeholder(content: {
                                            ProgressView()
                                        })
                                        .renderingMode(.original)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: (geo.frame(in: .global).width)/5 , height: 150)
                                        .cornerRadius(10)
                                }
                            }

                        }
                    }
                    Spacer()
                }
                .padding()
                
                
            }
                
        }
        .frame(width: screen.width/1.5, height: screen.height - 60)
        .background(Color.white.opacity(0.6))
        .background(BlurView())
        .preferredColorScheme(.light)
        .ignoresSafeArea(.all)
    }
}

struct home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct LeftSideBar: View {
    @State var selected = "home"
    @Namespace var animation
    var body: some View {
        VStack(spacing: 20) {
            Group{
                HStack{
                    Image("pinterest")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text("Pinterest")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                TabButton(image: "house", text: "home", selected: $selected, animation: animation)
                TabButton(image: "person", text: "Following ", selected: $selected, animation: animation)
                TabButton(image: "sunset", text: "Recents ", selected: $selected, animation: animation)
                TabButton(image: "house", text: "Log Out ", selected: $selected, animation: animation)
                
                HStack {
                    Text("Insights")
                        .foregroundColor(.gray)
                        .font(.title3)
                    Spacer()
                }.padding()
                
                TabButton(image: "message", text: "Messages ", selected: $selected, animation: animation)
                TabButton(image: "bell", text: "Notifications", selected: $selected, animation: animation)
                
                Spacer(minLength: 0)
            }
            
            //.padding()
            
            VStack(spacing: 10){
                Image("business")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                //.frame(width: 150)
                
                Button(action: {
                    
                }, label: {
                    Text("Unlock Business Tools")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                }).buttonStyle(PlainButtonStyle())
                Text("Hurry up ! Now you can unlock new feature at your fingertips")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .foregroundColor(.gray)
                
            }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            HStack{
                Image("kio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Sergio Shaon")
                        .fontWeight(.semibold)
                    
                    Text("Last Login 08/12/20")
                        .foregroundColor(.gray)
                }.padding(.top, 5)
                
                Image(systemName: "chevron.right")
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
            .padding(.vertical)
            
            
            
            Spacer()
        }
        .frame(width: 300)
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
