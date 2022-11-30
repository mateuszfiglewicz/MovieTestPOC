//
//  View+Extensions.swift
//  MovieApp
//
//  Created by Mateusz Figlewicz on 29/11/2022.
//

import Foundation
import SwiftUI

extension View {

    func embedInNavigationView() -> some View {
        NavigationView { self }
    }

}
