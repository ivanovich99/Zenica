
import SwiftUI

struct FoodView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .ignoresSafeArea()  
            Button{
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                    show.toggle()
                }
            }label:{
                Image(systemName: "xmark")}
            .font(.body.weight(.bold))
            .foregroundColor(.secondary)
            .padding(8)
            .background(.ultraThinMaterial, in: Circle())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
        }
        
        
    }
    
    
    var cover: some View{
        
        VStack{
            Spacer()
        }
        .frame(maxWidth: .infinity)
        
        .frame(height: 300)
        
        .foregroundColor(.white)
        .background (
            Image("fetuccini")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "fetuccini", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12){
                Text("Fetuccini")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Alfredo con pollo".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "Subtitle", in: namespace)
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style:.continuous))
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y:155)
                .padding(20)
        )
        
    }
}

struct FoodView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        FoodView(namespace: namespace, show: .constant(true))
    }
}
