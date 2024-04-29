//
//  UpdateView.swift
//  MyContacts
//
//  Created by Cristian David Laguna Aldana on 28/04/24.
//

import SwiftUI
import SwiftData

struct UpdateView: View {
    @Environment(\.dismiss) var dismiss // se usa para cerrar la vista
    

    @Bindable var contact: Contact //State variable para mantener los datos del contacto que se está actualizando
    
    var body: some View {
        List {
            TextField("First Name", text: $contact.firstName)
            TextField("Last Name", text: $contact.lastName)
            TextField("Phone number", text: $contact.phoneNumber)
            TextField("Email", text: $contact.email)
            DatePicker("Birthday", selection: $contact.birthDay, displayedComponents: .date)
                .datePickerStyle(.compact)
            Button("Update") {
                //Implementar aquí la lógica para actualizar el contacto en el contexto de datos
                //Por ejemplo, puedees utilizar el atributo @Environment(\.modelContext)
                //Para acceder al contexto de datos y guardar los cambios en el contacto
                dismiss() // Cierra la vista de creación de contacto
            }
            .navigationTitle("Update Contact") //Tiítulo de la navegación
        }
    }
}

