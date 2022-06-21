//
//  Item.swift
//  PrimeraAPP (iOS)
//
//  Created by Iván Saura Cuadrado on 10/7/21.
//

import Foundation
import SwiftUI

struct Item {
    var id: Int
    var nombre: String
    var precio: Float
    var descripcion: String
    var imagen: Image
    
    var colorMarco: Color = Color.black
    var grosorMarco: Int = 2
}
