//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Alperen Sarışan on 30.01.2024.
//

import SwiftUI

struct QuoteView: View {
    
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    
    let show: String
    
    @State var sheetIsShowing = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.lowerNoSpaces)
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 150)
                        
                        switch viewModel.status {
                        case .success(let data):
                            
                            Text("\" \(data.quote.quote) \"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .cornerRadius(25)
                                .padding(.horizontal)
                            
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: data.character.images[0]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                                .onTapGesture {
                                    sheetIsShowing.toggle()
                                }
                                .sheet(isPresented: $sheetIsShowing) {
                                    CharacterView(show: show, character: data.character)
                                }
                                
                                
                                Text(data.quote.character)
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                            }
                            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                            .cornerRadius(80)
                            
                        case .fetching:
                            ProgressView()
                            
                        default:
                            EmptyView()
                        }
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        Task {
                            await viewModel.getData(for: show)
                        }
                    }, label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundStyle(.white)
                            .padding()
                            .background(Color("\(show.noSpaces)Button"))
                            .cornerRadius(15)
                            .shadow(color: (Color("\(show.noSpaces)Shadow")), radius: 10)
                    })
                    Spacer(minLength: 180)
                }
                .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView(show: Constants.bbName)
        .preferredColorScheme(.dark)
}
