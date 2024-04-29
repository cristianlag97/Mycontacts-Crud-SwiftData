//
//  Contact.swift
//  MyContacts
//
//  Created by Cristian David Laguna Aldana on 28/04/24.
//

import Foundation
import SwiftData

//Modelo de datos para representar un contacto
@Model
final class Contact {
    var firstName: String //Nombre del contacto
    var lastName: String // Apellido del contacto
    var phoneNumber: String // Númerode teléfono del contacto
    var email: String //Correo electrónico del contacto
    var birthDay: Date // Fecha de cumpleaños
    
    /// Inicializador para crear un nuevo contacto
    /// - Parameters:
    ///     -- firstName:  Nombre de contacto. Por defecto es una cadena vacia.
    ///     - lastName: Apellido de contacto. Por defecto es una cadena vacia.
    ///     - PhoneNumber:  Número de teléfono. Por defecto es una cadena vacía.
    ///     - email: Correo electrónico. Por defecto es una cadena vacia.
    ///     - birthDay: Cumpleaños del contacto. Por defecto tiene la fecha actual
    init(firstName: String = "", lastName: String = "", phoneNumber: String = "", email: String = "", birthDay: Date = .now) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        self.birthDay = birthDay
    }
}
