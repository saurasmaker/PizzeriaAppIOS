//
//  SeleccionView.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 10/7/21.
//

import SwiftUI

struct SeleccionView: View {
    
    var item: Item
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.nombre).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(maxWidth: .infinity, alignment: .leading)
                Text("+ " + String(format: "%.2f", item.precio) + " €").frame(maxWidth: .infinity, alignment: .leading)
            }

            item.imagen.resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(0).background(Color.red).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.black, lineWidth: 1)).shadow(radius: 10)
        }
        
        
    }
}

struct SeleccionView_Previews: PreviewProvider {
    static var previews: some View {
        SeleccionView(item: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")))
    }
}


