//
//  FoodItems.swift
//  Bonsai p1
//
//  Created by CETYS Universidad  on 04/10/23.
//

import SwiftUI

struct FoodItems: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("Fetuccini")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Alfredo con pollo".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "Subtitle", in: namespace)
            }
            .padding(10)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style:.continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            
            
            }
        .padding(20)
        .foregroundColor(.white)
        .background(
            Image("fetuccini")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "fetuccini", in: namespace))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
            .matchedGeometryEffect(id: "mask", in: namespace))
        .frame(height: 200)
        .padding(20)
    }
}

struct FoodItems_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        FoodItems(namespace: namespace, show: .constant(true))
    }
}
