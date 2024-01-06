//
//  DestinationSearchView.swift
//  AirBnBClone
//
//  Created by User on 6.1.2024.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuests = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.show.toggle()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Spacer()
                
                if !self.destination.isEmpty {
                    Button("Clear") {
                        self.destination = ""
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            
            VStack(alignment: .leading) {
                if self.selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $destination)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: self.selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) { self.selectedOption = .location
                }
            }
            
            
            // Date selection
            VStack(alignment: .leading) {
                if self.selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: self.$startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: self.$endDate, displayedComponents: .date)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                    
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: self.selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    self.selectedOption = .dates
                }
            }
            
            
            // Number of guest selection
            VStack(alignment: .leading) {
                if self.selectedOption == .guests {
                    Text("Who's coming")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(self.numberOfGuests) Adults")
                    } onIncrement: {
                        self.numberOfGuests += 1
                    } onDecrement: {
                        guard self.numberOfGuests > 0 else { return }
                        self.numberOfGuests -= 1
                    }
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                    
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: self.selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {
                    self.selectedOption = .guests
                }
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}


struct CollapsableDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
