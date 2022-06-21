//
//  MainView.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado
//

import SwiftUI

struct MainView: View {
    
    @State private var pizzaItems = PizzaItems(
        tamanosList: [Item(id: 1, nombre: "Pequena", precio: 1.0, descripcion: "descripcion", imagen: Image("pizza_pequena")),
                      Item(id: 2, nombre: "Mediana", precio: 1.25, descripcion: "descripcion", imagen: Image("pizza_mediana")),
                      Item(id: 3, nombre: "Grande", precio: 1.50, descripcion: "descripcion", imagen: Image("pizza_grande"))],
        
        masasList: [Item(id: 2, nombre: "Fina", precio: 1.0, descripcion: "descripcion", imagen: Image("masa_fina")),
                    Item(id: 3, nombre: "Gorda", precio: 1.15, descripcion: "descripcion", imagen: Image("masa_gorda")),
                    Item(id: 4, nombre: "Rellena", precio: 1.30, descripcion: "descripcion", imagen: Image("masa_rellena"))],
        
        pizzasList: [Item(id: 1, nombre: "Personalizada", precio: 0.0, descripcion: "descripcion", imagen: Image("yo_me_lo_monto")),
                     Item(id: 2, nombre: "Margarita", precio: 6.0, descripcion: "descripcion", imagen: Image("pizza_margarita")),
                     Item(id: 3, nombre: "Carbonara", precio: 7.0, descripcion: "descripcion", imagen: Image("pizza-a-la-carbonara")),
                     Item(id: 4, nombre: "Barbacoa", precio: 8.0, descripcion: "descripcion", imagen: Image("receta-pizza-barbacoa"))],
        
        quesosList: [Item(id: 1, nombre: "Mozarela", precio: 0.5, descripcion: "descripcion", imagen: Image("queso_mozzarella")),
                     Item(id: 2, nombre: "Cheddar", precio: 0.75, descripcion: "descripcion", imagen: Image("queso_cheddar")),
                     Item(id: 3, nombre: "Parmesano", precio: 0.25, descripcion: "descripcion", imagen: Image("queso_parmesano")),
                     Item(id: 4, nombre: "Sin queso", precio: 0.0, descripcion: "descripcion", imagen: Image("no"))],
        
        ingredientesList: [Item(id: 1, nombre: "Jamon Cocido", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_jamon_cocido")),
                           Item(id: 2, nombre: "Jamon Serrano", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_jamon")),
                           Item(id: 3, nombre: "Pepperoni", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_peperoni")),
                           Item(id: 4, nombre: "Pavo", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_pavo")),
                           Item(id: 5, nombre: "Salchicha", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_salchicha")),
                           Item(id: 6, nombre: "Aceituna", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_aceituna")),
                           Item(id: 7, nombre: "Cebolla", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_cebolla")),
                           Item(id: 8, nombre: "Pimiento", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_pimiento")),
                           Item(id: 9, nombre: "Piña", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_pina")),
                           Item(id: 10, nombre: "Anchoas", precio: 0.5, descripcion: "descripcion", imagen: Image("ingr_anchoa"))]
    )

    
    
    @State private var pizza = Pizza(
          tamano: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
          masa: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
          nombre: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
          queso: Item(id: 0, nombre: "name", precio: 0.0, descripcion: "descripcion", imagen: Image("FVMisterRed")),
          ingredientes: [Item]())
    
    var body: some View {
        NavigationView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: nil, content: {
                Image("PortadaPizza").resizable().frame(width: 350, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(0).background(Color.red).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.black, lineWidth: 4)).shadow(radius: 10)
                Text("Monta las pizzas que quieras a tu gusto!").multilineTextAlignment(.center).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).padding().font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                Spacer()
                
                NavigationLink (
                    destination: PasoElegirTamano(pizza: $pizza, pizzaItems: $pizzaItems),
                    label: {
                        Text("Hacer pedido")
                    }).padding().navigationTitle("TemandoPizza")
                
                
                NavigationLink (
                    destination: AcercaDeView(),
                    label: {
                        Text("Acerca de")
                    }).padding(10)
            })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


/*
 Declaración
 */



