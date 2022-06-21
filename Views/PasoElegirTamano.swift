//
//  PasoElegirTamano.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 10/7/21.
//

import SwiftUI

struct PasoElegirTamano: View {
    
    @State private var action: Int? = 0
    
    @Binding var pizza: Pizza
    @Binding var pizzaItems: PizzaItems

    var body: some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            
            Text("Elige el tamaño que quieres")
            List(pizzaItems.tamanosList, id: \.id){ tamano in
                
                VStack{
                    
                    SeleccionView(item: tamano).onTapGesture{
                        pizza.tamano = tamano
                        self.action = tamano.id
                        print(pizza.tamano.nombre)
                    }
                    
                    NavigationLink (destination: PasoElegirMasa(pizza: $pizza, pizzaItems: $pizzaItems), tag: tamano.id, selection: $action){
                        EmptyView()
                    }.opacity(0).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
            }
        })
    }
}





struct PasoElegirTamano_Previews: PreviewProvider {
    static var previews: some View {
        PasoElegirTamano(
            pizza: .constant(Pizza(tamano: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                         masa: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                         nombre: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                         queso: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                         ingredientes: [Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                                        Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                                        Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                                        Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                                        Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed"))])),
                             
            pizzaItems: .constant (PizzaItems(
                tamanosList: [Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                              Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed"))],
                masasList: [Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                            Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed"))],
                pizzasList: [Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                             Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed"))],
                quesosList: [Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                             Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed"))],
                ingredientesList: [Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
                                   Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed"))]
            )))
    }
}
