//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Sally on 21/08/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
  var body: some View {
    ZStack {
      LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
      VStack {
        Text("London, UK")
          .font(.system(size: 32))
          .fontWeight(.medium)
          .foregroundStyle(.white)
          .padding(.top , 20)
        VStack {
          Image(systemName:"cloud.sun.fill")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
          Text("76°")
            .font(.system(size: 60))
            .foregroundStyle(.white)
        }
        Spacer()
        HStack(spacing: 20) {
          ExtractedView(day: "Sun", image: "cloud.sun.fill", degree: 76)
          ExtractedView(day: "Sun", image: "cloud.sun.fill", degree: 76)
          ExtractedView(day: "Tue", image: "cloud.sun.rain.fill", degree: 65)
          ExtractedView(day: "Wen", image: "cloud.sun.bolt.fill", degree: 60)
          ExtractedView(day: "Thu", image: "cloud.sun.fill", degree: 68)
        }
        Spacer()
        Button {
          print("Tapped ..")
        } label: {
          Text("Change day time")
            .frame(width: 300,height: 50)
            .background(Color(.white))
            .foregroundStyle(.blue)
            .font(.system(size: 20 , weight: .bold))
        } .cornerRadius(5)
        Spacer()
      }
     
      
    }
    
    
  }
}

#Preview {
  ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

struct ExtractedView: View {
  var day: String
  var image: String
  var degree:Int
  var body: some View {
    VStack {
      Text(day)
        .font(.system(size: 20))
        .foregroundStyle(.white)
      Image(systemName:image)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 60, height: 60)
      Text("\(degree)°")
        .font(.system(size: 25))
        .foregroundStyle(.white)
    }
  }
}
