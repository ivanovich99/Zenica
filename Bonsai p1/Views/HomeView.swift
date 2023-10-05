//
//  HomeView.swift
//  Bonsai p1
//
//  Created by CETYS Universidad  on 04/10/23.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @Binding var show = false
    
    var body: some View {
        ZStack{
            
            Image("fondo").resizable().edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView{
                    Spacer()
                        .padding(20)
                    Text("Not healthy lol")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: 325, alignment: .leading)
                    
                    ScrollView(.horizontal){
                        if !show{
                            FoodItems(namespace: namespace, show: $show)
                                .onTapGesture{
                                    withAnimation(.spring(response:0.6, dampingFraction: 0.8)){
                                        show.toggle()
                                    }
                                }
                        }
                    }
                    
                    
                }
            }
           
            if show{
                FoodView(namespace: namespace, show: $show)
            }
           
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
