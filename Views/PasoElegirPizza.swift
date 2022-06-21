//
//  PasoElegirPizza.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 10/7/21.
//

import SwiftUI

struct PasoElegirPizza: View {
    
    @State private var action: Int? = 0
    
    @Binding var pizza: Pizza
    @Binding var pizzaItems: PizzaItems
    
    var body: some View {
        
        Text("Elige el tipo de pizza que quieres")
        List(pizzaItems.pizzasList, id: \.id){ auxPizza in
            VStack{
                SeleccionView(item: auxPizza).onTapGesture{
                    pizza.nombre = auxPizza
                    self.action = auxPizza.id
                }
                
                NavigationLink (destination: PasoElegirQueso(pizza: $pizza, pizzaItems: $pizzaItems), tag: auxPizza.id, selection: $action){
                    EmptyView()
                }.opacity(0).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
        }
        
    }
}

struct PasoElegirPizza_Previews: PreviewProvider {
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
                             
            pizzaItems: .constant(PizzaItems(
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
