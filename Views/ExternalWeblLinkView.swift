//
//  ExternalWeblLinkView.swift
//  Africa
//
//  Created by Florent on 16/10/2020.
//

import SwiftUI

struct ExternalWeblLinkView: View {
    
    let animal: Animal
    
    var body: some View {
        
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("wikipedia")
               
                Spacer()
                
                Group {
                    Link(animal.name, destination: (URL(string: animal.link) ??
                          URL(string: "https://wikipedia.org"))!)
                    
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWeblLinkView_Previews: PreviewProvider {
    static var previews: some View {
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        ExternalWeblLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
