//
//  ContentView.swift
//  JoeTestApp
//
//  Created by Bill Gestrich on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showActivityView = false

    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.showActivityView = true
                        }) {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }.sheet(isPresented: $showActivityView) {
                    ActivityView(isPresented: $showActivityView, activityItems: ["This is a text to share"])
                }
        }
    }
}

struct ActivityView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let activityItems: [Any]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        controller.completionWithItemsHandler = { (_, _, _, _) in
            self.isPresented = false
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
