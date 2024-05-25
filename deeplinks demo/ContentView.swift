//
//  ContentView.swift
//  deeplinks demo
//
//  Created by Sarp Bozkurt on 25.05.2024.
//

import SwiftUI


enum NavigationRoute: Hashable {
    case home
    case detail
}

struct ContentView: View {
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            HomeView()
                .navigationDestination(for: NavigationRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    case .detail:
                        DetailView()
                    }
                }
                .onOpenURL { url in
                    handleURL(url)
                }
        }
    }
    
    private func handleURL(_ url: URL) {
        if let host = url.host {
            switch host {
            case "home":
                navigationPath.append(NavigationRoute.home)
            case "detail":
                navigationPath.append(NavigationRoute.detail)
            default:
                break
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home View")
                .font(.largeTitle)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
        }
    }
}
#Preview {
    ContentView()
}
