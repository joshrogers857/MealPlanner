//
//  DeviceRotationViewModifier.swift
//  MealPlanner
//
//  Created by Joshua Rogers on 16/03/2022.
//
//  Code by Paul Hudson, HackingWithSwift.com:
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-detect-device-rotation
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
