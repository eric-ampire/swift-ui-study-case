//
//  DetailView.swift
//  swift-ui-study-case
//
//  Created by Guest on 29/08/2021.
//

import SwiftUI
import SwiftUIX

struct DetailView: View {
    
    var namespace: Namespace.ID
    @State var appear = false
    
    var body: some View {
        VStack(spacing: 16) {
            
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
            .frame(maxWidth: .infinity, maxHeight: 500)
            .background(
                Image(uiImage: #imageLiteral(resourceName: "image1"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "image", in: namespace)
            )
            .mask(
                RoundedRectangle(cornerRadius: 0, style: .continuous)
                    .matchedGeometryEffect(id: "shape", in: namespace)
            )
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0.0, y: 10.0)
            
            Text("Get the details, frameworks, and tools you need to use system fonts for Apple platforms in your apps. These typefaces offer the control and flexibility to optimally display text at a variety of sizes, in many different languages, across multiple interfaces.")
                .font(.body)
                .padding()
                .offset(y: appear ? 0 : -300)
                .onAppear{
                    appear = true
                }
                .onDisappear {
                    appear = false
                }
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}

struct DetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        DetailView(namespace: namespace)
    }
}
