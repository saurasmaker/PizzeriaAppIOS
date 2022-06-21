//
//  PasoElegirQueso.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 10/7/21.
//

import SwiftUI

struct PasoElegirQueso: View {
    @State private var action: Int? = -1
    @State private var action2: Int? = 0
    @Binding var pizza: Pizza
    @Binding var pizzaItems: PizzaItems
    
    var body: some View {
        
        Text("Elige el tipo de queso que quieres")
        List(pizzaItems.quesosList, id: \.id){ queso in
            VStack{
                SeleccionView(item: queso).onTapGesture{
                    pizza.queso = queso
                    self.action = queso.id
                    print("")
                }
                
                if(pizza.nombre.id == 1){
                    NavigationLink (destination: PasoElegirIngredientes(pizza: $pizza, pizzaItems: $pizzaItems), tag: queso.id, selection: $action){
                        EmptyView()
                    }.opacity(0).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                else{
                    NavigationLink (destination: PasoConfirmarPedido(pizza: $pizza, pizzaItems: $pizzaItems), tag: queso.id, selection: $action){
                        EmptyView()
                    }.opacity(0).disabled(true)
                }
            }
        }
        
    }
}

struct PasoElegirQueso_Previews: PreviewProvider {
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
