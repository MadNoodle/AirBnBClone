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
    // MARK: - Dependencies
    @ObservedObject var viewModel: ExploreViewModel
    
    // MARK: - State Management
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numberOfGuests = 0
    
    // MARK: - Navigation properties
    @Binding var show: Bool
    
    // MARK: - UI
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.snappy) {
                        self.show.toggle()
                        self.viewModel.updateListing()
                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                Spacer()
                
                if !self.viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        self.viewModel.searchLocation = ""
                        self.viewModel.updateListing()
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
                        
                        TextField( "Search destinations", text: self.$viewModel.searchLocation)
                            .onSubmit {
                                self.viewModel.updateListing()
                                self.show.toggle()
                            }
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
            .collapsable()
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
            .collapsable()
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
            .collapsable()
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
    DestinationSearchView(
        viewModel: ExploreViewModel(service: DIContainer.mock.exploreService),
        show: .constant(true)
    )
}
