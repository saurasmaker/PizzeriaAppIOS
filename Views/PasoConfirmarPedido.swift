//
//  PasoConfirmarPerdido.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 11/7/21.
//

import SwiftUI

struct PasoConfirmarPedido: View {
    @State private var action: Int? = -1
    @Binding var pizza: Pizza
    @Binding var pizzaItems: PizzaItems
        
    var body: some View {
        VStack {
            Text("Tu pedido").font(.title).padding(10)
            HStack{
                Text("Tamano: " + pizza.tamano.nombre)
                Spacer()
                Text(String(pizza.tamano.precio) + " €")
            }.padding(5)
            HStack{
                Text("Masa: " + pizza.masa.nombre)
                Spacer()
                Text(String(pizza.masa.precio) + " €")
            }.padding(5)
            HStack{
                Text("Queso: " + pizza.queso.nombre)
                Spacer()
                Text(String(pizza.queso.precio) + " €")
            }.padding(5)

            
            if(pizza.nombre.id == 1){
                Text("Ingredientes")
                List(pizza.ingredientes, id: \.id){ ingrediente in
                    HStack{
                        Text("Queso: " + ingrediente.nombre)
                        Spacer()
                        Text(String(ingrediente.precio) + " €")
                    }
                }
            }
            else{
                HStack{
                    Text("Pizza: " + pizza.nombre.nombre)
                    Spacer()
                    Text(String(pizza.nombre.precio) + " €")
                }.padding(5)
            }
            
            
            Spacer()
            HStack{
                Text("Total: " + String(sumarTotalPrecio()))
            }.padding(20)
            
            NavigationLink (destination: NumeroYDireccionView(), tag: 1, selection: $action){
                EmptyView()
            }.opacity(0).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            Button("Confirmar"){
                action = 1
            }

        }.padding(10)
    }
    
    func sumarTotalPrecio() -> Float{
    
        var total = 0.0
        
        total+=Double(pizza.tamano.precio + pizza.masa.precio + pizza.queso.precio)
        
        
        if(pizza.nombre.id == 1 && pizza.ingredientes.count > 0){
            for i in 0...pizza.ingredientes.count-1 {
                total += Double(pizza.ingredientes[i].precio)
            }
        }
        else{
            total += Double(pizza.nombre.precio)
        }
        return Float(total)
    }

}



struct PasoConfirmarPedido_Previews: PreviewProvider {
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
