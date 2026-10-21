//
//  PeopleListView.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 19/10/26.
//

import SwiftUI

struct PeopleListView: View {
    
    @State private var viewModel = PeopleViewModel()
    var film: Film
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                
                FilmImageView(url: film.bannerImage)
                    .frame(height: 300)
                    .containerRelativeFrame(.horizontal)
                    
                VStack(alignment: .leading){
                    
                    Text(film.title)
                        .font(.title)
                        .bold()
                    
                    Grid(alignment: .leading){
                        
                        InfoRow(label: "Director", value: film.director)
                        InfoRow(label: "Producer", value: film.producer)
                        InfoRow(label: "Release Date", value: film.releaseYear)
                        InfoRow(label: "Running Time", value: "\(film.director) minutes")
                        InfoRow(label: "Score", value: "\(film.score)/100")
                    }
                    .padding(.vertical, 8)
                    
                    
                    Divider()
                    
                    Text("Description")
                        .font(.headline)
                    
                    Text(film.description)
                        .padding(.top, 2)
                    
                    
                    Divider()
                                        
                    CharacterSectionView(viewModel: viewModel)
                        
                }
                .padding()
            }
            .task{
                await viewModel.fetchPeople(for: film)
            }
        }
    }
}

fileprivate struct InfoRow : View {
    let label : String
    let value : String
    
    var body : some View {
        GridRow{
            Text(label)
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text(value)
            .font(.subheadline)
        }
    }
    
}


fileprivate struct CharacterSectionView:  View {
    
    let viewModel: PeopleViewModel
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 12) {
                Text("Characters")
                    .font(.headline)
                
                switch viewModel.state {
                    case .idle: EmptyView()
                    case .loading:  ProgressView()
                        
                    case .loaded(let people):
                        ForEach(people) { person in
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(person.name)
                                
                                HStack(spacing: 8) {
                                    Label(person.gender, systemImage: "person.fill")
                                      
                                    Text("Age: \(person.age)")
                                    Spacer()
                                    Label(person.eyeColor, systemImage: "eye")
                                    Text("Hair: \(person.hairColor)")
                                }
                                .foregroundColor(.secondary)
                                .font(.caption)
                                .lineLimit(1)
                                
                            }
                        }
                        
                    case .error(let error):
                        Text(error)
                            .foregroundStyle(.pink)
                }
            }
        }
    }
} 


#Preview {
    PeopleListView(film: Film(
        id: "1",
        title: "Spirited Away",
        image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
        bannerImage: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
        description: "An animated fantasy film",
        director: "Hayao Miyazaki",
        producer: "Toshio Suzuki",
        releaseYear: "2001",
        score: "97",
        duration: "125",
        people: ["https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9",
                 "https://ghibliapi.vercel.app/people/fe93adf2-2f3a-4ec4-9f68-5422f1b87c01",
                 "https://ghibliapi.vercel.app/people/3bc0b41e-3569-4d20-ae73-2da329bf0786",
                 "https://ghibliapi.vercel.app/people/40c005ce-3725-4f15-8409-3e1b1b14b583",
                 "https://ghibliapi.vercel.app/people/5c83c12a-62d5-4e92-8672-33ac76ae1fa0",
                 "https://ghibliapi.vercel.app/people/e08880d0-6938-44f3-b179-81947e7873fc",
                 "https://ghibliapi.vercel.app/people/2a1dad70-802a-459d-8cc2-4ebd8821248b"]
    ))
}
