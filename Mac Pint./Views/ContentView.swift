//
//  ContentView.swift
//  Mac Pint.
//
//  Created by sergio shaon on 5/5/21.
//

import SwiftUI

struct ContentView: View {
    let screen = NSScreen.main!.visibleFrame
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
      }
}
