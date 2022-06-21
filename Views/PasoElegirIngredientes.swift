//
//  PasoElegirIngredientes.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 10/7/21.
//

import SwiftUI

/*
 
 */


struct PasoElegirIngredientes: View {

    @State private var continuar: Int? = 0
    
    @State private var isPresented: Bool = false
    @State private var isPresented2: Bool = false
    
    @Binding var pizza: Pizza
    @Binding var pizzaItems: PizzaItems
    
    
    var body: some View {
        Text("Elige hasta 5 ingredientes")
        List(pizzaItems.ingredientesList, id: \.id){ ingrediente in

            VStack{
                HStack{
                    VStack(alignment: .leading) {
                        Text(ingrediente.nombre).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).frame(maxWidth: .infinity, alignment: .leading)
                        Text("+ " + String(format: "%.2f", ingrediente.precio) + " €").frame(maxWidth: .infinity, alignment: .leading)
                    }

                    ingrediente.imagen.resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(0).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(ingrediente.colorMarco, lineWidth: CGFloat(ingrediente.grosorMarco))).shadow(radius: 10)
                }.onTapGesture{
                    let pos = buscarIngrediente(ingrediente: ingrediente)
                    
                    if(pos > -1){
                        pizza.ingredientes.remove(at: pos)
                        pizzaItems.ingredientesList[ingrediente.id-1].colorMarco = Color.black
                        pizzaItems.ingredientesList[ingrediente.id-1].grosorMarco = 2
                    }
                    else if(pizza.ingredientes.count < 5){
                        pizza.ingredientes.append(ingrediente)
                        pizzaItems.ingredientesList[ingrediente.id-1].colorMarco = Color.green
                        pizzaItems.ingredientesList[ingrediente.id-1].grosorMarco = 4
                        isPresented = false;
                    }else{
                        isPresented = true;
                    }
                    
                    
                }

            }
            .alert(isPresented: $isPresented, content: {
                Alert(title: Text("Numero maximo de ingredientes alcanzado"),
                      message: Text("Ya no puede anadir mas ingredientes ya que el maximo es de 5. Si quieres cambiarlos puedes hacer 'tab' en el que quieras quitar y asi haras hueco para uno mas."),
                      dismissButton: Alert.Button.default(Text("Aceptar")))
            })
            
            
        }
        
        
        .alert(isPresented: $isPresented2, content: {
            Alert(title: Text("No has seleccionado ningun ingrediente"),
                  message: Text("Debes seleccionar al menor un ingrediente para poder continuar."),
                  dismissButton: Alert.Button.default(Text("Aceptar")))
        })
        
        Button("Continuar") {
            if(pizza.ingredientes.count > 0){
                continuar = 100
            }
            else{
                isPresented2 = true
            }
        }
        NavigationLink (destination: PasoConfirmarPedido(pizza: $pizza, pizzaItems: $pizzaItems),
                        tag: 100, selection: $continuar){
            EmptyView()
        }.opacity(0).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
    
    
    
    private func buscarIngrediente(ingrediente: Item) -> Int {
        
        if(pizza.ingredientes.count > 0){
            for i in 0 ... (pizza.ingredientes.count - 1) {
                if(pizza.ingredientes[i].nombre == ingrediente.nombre){
                    return i
                }
            }
        }
        
        return -1
    }
}






/*
 Prueba
 */
struct PasoElegirIngredientes_Previews: PreviewProvider {
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
