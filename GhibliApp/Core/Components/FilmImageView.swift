//
//  FilmImageView.swift
//  GhibliApp
//
//  Created by Mohammad Farooq on 20/10/26.
//

import SwiftUI

struct FilmImageView: View {
    let url : String
    var body: some View {
       
        AsyncImage(url: URL(string: url)){ phase in
            switch phase {
            case .empty:
                Color.gray
                    .overlay{
                        ProgressView()
                            .controlSize(.large)
                    }
            case .success(let image):
                image
                    .resizable().scaledToFill()
            case .failure(let error):
                Text("Could not get image")
            @unknown default:
                fatalError()
            }
        }
        
    }
}

#Preview {
    FilmImageView(url: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg")
}
