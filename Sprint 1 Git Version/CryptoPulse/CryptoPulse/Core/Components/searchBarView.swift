//
//  searchBarView.swift
//  CryptoPulse
//
//  Created by Ravi Tiwari on 11/8/23.
//

import SwiftUI

struct searchBarView: View {
    
    @Binding var searchText: String
    
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent)
            
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            searchText = ""
                            hideKeyboard()
                        }
                }
        }

        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.15), radius: 10, x:0, y:0
                )
                .padding()
        )
    }
}

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

struct searchBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group{
            searchBarView(searchText: .constant(""))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
            
            searchBarView(searchText: .constant(""))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
        }
    }
}
