//
//  DeviceInfo.swift
//  congenial-garbanzo
//
//  Created by m1_air on 8/17/24.
//

import Foundation
import Network
import SwiftUI
import UIKit
import CoreTelephony
import SystemConfiguration.CaptiveNetwork

class DeviceInfo {
    
    // MARK: - Device Information
    
    func getDeviceName() -> String {
        return UIDevice.current.name
    }
    
    func getDeviceModel() -> String {
        return UIDevice.current.model
    }
    
    func getDeviceSystemName() -> String {
        return UIDevice.current.systemName
    }
    
    func getDeviceSystemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getDeviceIdentifier() -> UUID? {
        return UIDevice.current.identifierForVendor
    }
    
    // MARK: - Screen Information
    
    func getScreenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func getScreenScale() -> CGFloat {
        return UIScreen.main.scale
    }
    
    func getScreenBrightness() -> CGFloat {
        return UIScreen.main.brightness
    }
    
    // MARK: - Orientation Information
    
    func getDeviceOrientation() -> UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    func getInterfaceOrientationIOS15() -> UIInterfaceOrientation? {
        return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
    }
    
    func getInterfaceOrientationIOS16() -> UIInterfaceOrientation? {
           guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
               return nil
           }
           return windowScene.interfaceOrientation
       }
    
    // MARK: - Battery Information
    
    func getBatteryLevel() -> Float {
        return UIDevice.current.batteryLevel
    }
    
    func getBatteryState() -> UIDevice.BatteryState {
        return UIDevice.current.batteryState
    }
    
    // MARK: - Locale and Language
    
    func getCurrentLocale() -> Locale {
        return Locale.current
    }
    
    func getPreferredLanguage() -> String? {
        return Locale.preferredLanguages.first
    }
    
    // MARK: - Connectivity
    
    func getNetworkReachability() -> Bool {
        // Basic reachability check using NWPathMonitor (requires Network framework)
        let monitor = NWPathMonitor()
        var isReachable = false
        monitor.pathUpdateHandler = { path in
            isReachable = path.status == .satisfied
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        return isReachable
    }
    
    func getWiFiSSID() -> String? {
        if let interfaces = CNCopySupportedInterfaces() as? [String] {
            for interface in interfaces {
                if let info = CNCopyCurrentNetworkInfo(interface as CFString) as NSDictionary? {
                    return info[kCNNetworkInfoKeySSID as String] as? String
                }
            }
        }
        return nil
    }
    
    // MARK: - System and Hardware Capabilities
    
    func isMultitaskingSupported() -> Bool {
        return UIDevice.current.isMultitaskingSupported
    }
    
    func isProximityMonitoringEnabled() -> Bool {
        return UIDevice.current.isProximityMonitoringEnabled
    }
    
    func getUserInterfaceIdiom() -> UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
    // MARK: - Environment Values in SwiftUI (Requires SwiftUI Environment)
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    func getColorScheme() -> ColorScheme {
        return colorScheme
    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    func getHorizontalSizeClass() -> UserInterfaceSizeClass? {
        return horizontalSizeClass
    }
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    func getVerticalSizeClass() -> UserInterfaceSizeClass? {
        return verticalSizeClass
    }
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion: Bool
    
    func getReduceMotionSetting() -> Bool {
        return reduceMotion
    }
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency: Bool
    
    func getReduceTransparencySetting() -> Bool {
        return reduceTransparency
    }
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize: DynamicTypeSize
    
    func getDynamicTypeSize() -> DynamicTypeSize {
        return dynamicTypeSize
    }
}
