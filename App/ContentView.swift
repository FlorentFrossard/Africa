//
//  ContentView.swift
//  Africa
//
//  Created by Florent on 15/10/2020.
//

import SwiftUI

struct ContentView: View {
    
  let animals: [Animal] = Bundle.main.decode("animals.json")
    
  var body: some View {

       NavigationView {
            List {
                CoverImageView()
                  .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0,bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(
                        destination: AnimalDetailView(animal: animal))
                    {
                        AnimalListItemVIew(animal: animal)
                    }
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            
        } //: End of Nav
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
