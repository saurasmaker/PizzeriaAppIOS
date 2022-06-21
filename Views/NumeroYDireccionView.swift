//
//  NumeroYDireccionView.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 11/7/21.
//

import SwiftUI

struct NumeroYDireccionView: View {
    @State private var mapViewState: Bool = true
    @State private var mapViewOpacity: Double = 1.0
    
    @State private var isPresented: Bool = false
    @State private var numero: String = "Numero de tlf..."
    @State private var direccion: String = "Direccion..."
    @State private var codigoVerificacion: String? = "Codigo..."
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("Entrega").font(.title).padding(10)
            
            VStack(alignment: .leading){
                Text("Direccion de entrega: ")
                    .padding(.leading)
                TextField("", text: $direccion).background(Color(red: 0, green: 0, blue: 0, opacity: 0.1)).padding(10)
                
                Text("Introduce tu numero de TLF para confirmar el pedido:")
                    .padding(.leading)
                TextField("", text: $numero).background(Color(red: 0, green: 0, blue: 0, opacity: 0.1)).padding(10)
            }
            
            Button("Enviar"){
                mapViewState = false;
                isPresented = true;
                mapViewOpacity = 1
                
            }.padding(20)
            
            /*
            .textFieldAlert(isPresented: $isPresented, content: {
                TextFieldAlert(title: Text("Verificate"),
                      message: Text("Escribe aqui el codigo de verificacion que te ha llegado por SMS al numero " + numero + "."),
                      primaryButton: Alert.Button.default(Text("Enviar")),
                      secondaryButton: Alert.Button.destructive(Text("Cancelar")))
            })
            */
            .textFieldAlert(isPresented: $isPresented) { () -> TextFieldAlert in
                    TextFieldAlert(title: "Verificate", message: "Escribe aqui el codigo de verificacion que te ha llegado por SMS al numero " + numero + ".", text: self.$codigoVerificacion)
            }
            
            Spacer()
            
            MapView().disabled(mapViewState).opacity(mapViewOpacity)
            
        }
        
    }
}

struct NumeroYDireccionView_Previews: PreviewProvider {
    static var previews: some View {
        NumeroYDireccionView()
    }
}

