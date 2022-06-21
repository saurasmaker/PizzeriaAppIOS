//
//  AcercaDe.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 11/7/21.
//

import SwiftUI
import WebKit

struct AcercaDeWebView: UIViewRepresentable {

    private let request: URLRequest = URLRequest(url: URL(string: "https://www.ucam.edu/")!)
        
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
        
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}


struct AcercaDeWebView_Previews: PreviewProvider {
    static var previews: some View {
        AcercaDeWebView()
    }
}
