//
//  SearchBar.swift
//  Young Tutors
//
//  Created by Kendall Easterly on 12/10/20.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchFieldText: String
    @Binding var customSearchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(UIColor.tertiaryLabel))
            
            TextField("Search", text: $searchFieldText) { (changing) in } onCommit: {
                self.hideKeyboard()
                self.searchFieldText = ""
            }.onChange(of: searchFieldText) { (value) in
                withAnimation {
                    
                    self.customSearchText = value
                    
                }
            }
            
            Spacer()
            
            Button {
                self.searchFieldText = ""
                self.hideKeyboard()
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(UIColor.tertiarySystemFill)))
    }
}