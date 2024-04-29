//
//  ContentView.swift
//  MyContacts
//
//  Created by Cristian David Laguna Aldana on 28/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var showCreateView: Bool = false // State variable para controlar la presentación de la vista de creación de contacto.
    
    @State private var editContact: Contact? // State esta variable para mantener el contacto que se está editando actualmente
    
    @Query private var contacts: [Contact] // Listado de contactos obtenidos a travez de un @Query
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(contacts) { contact in
                    HStack(spacing: 16) {
                        Text("👤")
                            .font(.largeTitle)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack{
                                Text(contact.firstName).font(.headline)
                                Text(contact.lastName).font(.headline)
                            }
                            Text(contact.phoneNumber).foregroundColor(.secondary)
                            Text(contact.email).foregroundColor(.secondary)
                            Text(contact.birthDay, format: Date.FormatStyle(date: .abbreviated))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            editContact = contact
                        }, label: {
                            Label("Edit", systemImage: "pencil").font(.headline).foregroundColor(.blue)
                        })
                    }
                    .padding(8)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: Color(.gray).opacity(0.3), radius: 4, x: 0, y: 2)
                    
                    .swipeActions{
                        Button(role: .destructive) {
                            withAnimation{
                                context.delete(contact)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("My Contacts 👤")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showCreateView.toggle() //Inviete la propiedad actual
                    }, label: {
                        Label("Add Contact", systemImage: "plus")
                    })
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(role: .destructive) {
                        withAnimation{
                            contacts.forEach { contact in
                                context.delete(contact)
                            }
                        }
                    } label: {
                        Label("Delete All", systemImage: "trash")
                    }
                }
            }
            .sheet(isPresented: $showCreateView) {
                NavigationStack {
                    CreateView()
                }.presentationDetents([.medium])
            }
            .sheet(item: $editContact) { // se muestra el modal cuando editContact no es nil
                editContact = nil // acá por lo que entiendo una vez se cierra el modal se pone en nil el editContact
            } content: { contact in
                UpdateView(contact: contact)
            }
        }
    }
}

/*#Preview {
    ContentView()
}
*/
