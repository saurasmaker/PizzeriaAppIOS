//
//  AcercaDeView.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 11/7/21.
//

import SwiftUI

struct AcercaDeView: View {
    var body: some View {
        VStack{
            VStack{
                Text("Datos de los alumnos").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Iván Saura Cuadrado - 48706006X - isaura2@alu.ucam.edu").padding(5)
                Text("Miguel Ángel González - 77853282F - magonzalez3@alu.ucam.edu").padding(5)
            }
            AcercaDeWebView()
        }
        
    }
}

struct AcercaDeView_Previews: PreviewProvider {
    static var previews: some View {
        AcercaDeView()
    }
}
