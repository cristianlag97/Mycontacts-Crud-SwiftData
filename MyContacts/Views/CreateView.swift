//
//  CreateView.swift
//  MyContacts
//
//  Created by Cristian David Laguna Aldana on 28/04/24.
//

import SwiftUI

struct CreateView: View {
    
    @Environment(\.dismiss) var dismiss // se usa para cerrar la vista
    @Environment(\.modelContext) var context
    
    @State private var contact = Contact() //State variable para amntener los datos del nuevocontacto que se está creando
    
    var body: some View {
        List {
            TextField("First Name", text: $contact.firstName)
            TextField("Last Name", text: $contact.lastName)
            TextField("Phone number", text: $contact.phoneNumber)
            TextField("Email", text: $contact.email).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            DatePicker("Birthday", selection: $contact.birthDay, displayedComponents: .date)
                .datePickerStyle(.compact)
            Button("Register") {
                withAnimation{
                    context.insert(contact) //Inserta el nuevo contactoen el contexto de datos
                }
                dismiss() // Cierra la vista de creación de contacto
            }
            .navigationTitle("Register Contact") //Tiítulo de la navegación
        }
    }
}
