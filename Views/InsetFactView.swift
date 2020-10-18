//
//  InsetFactView.swift
//  Africa
//
//  Created by Florent on 15/10/2020.
//

import SwiftUI

struct InsetFactView: View {
    
    var animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { facts in
                    Text(facts)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 140, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static var previews: some View {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
