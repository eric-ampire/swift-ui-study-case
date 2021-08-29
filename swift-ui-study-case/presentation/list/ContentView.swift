//
//  ContentView.swift
//  swift-ui-study-case
//
//  Created by Guest on 28/08/2021.
//

import SwiftUI
import SwiftUIX

struct ContentView: View {
    
    @Namespace var namespace
    @State var show = true
    
    var body: some View {
        ZStack {
            if show {
                VStack(spacing: 16) {
                    Text("Today")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Text("App of the day".uppercased())
                            .font(.largeTitle).bold()
                            .matchedGeometryEffect(id: "title", in: namespace)
                            .frame(maxWidth: 150, maxHeight: .infinity, alignment: .bottomLeading)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding()
                                        
                        HStack {
                            Image(uiImage: #imageLiteral(resourceName: "logo"))
                                .frame(width: 36, height: 36)
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "logo", in: namespace)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Code with Eric")
                                    .font(.body).bold()
                                    .matchedGeometryEffect(id: "app-title", in: namespace)
                                Text("Learn SwiftUI, React and UI Design")
                                    .font(.caption)
                                    .matchedGeometryEffect(id: "app-description", in: namespace)
                            }
                            .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding(12)
                        .background(
                            VisualEffectBlurView(blurStyle: .systemChromeMaterialDark)
                                .matchedGeometryEffect(id: "blur", in: namespace)
                        )
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 335)
                    .background(
                        Image(uiImage: #imageLiteral(resourceName: "image1"))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "image", in: namespace)
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .matchedGeometryEffect(id: "shape", in: namespace)
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
                    
                    Spacer()
                    
                }.padding(20)
            } else {
                DetailView(namespace: namespace)
            }
        }
        .animation(.spring())
        .onTapGesture {
            show.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
