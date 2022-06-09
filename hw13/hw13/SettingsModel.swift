//
//  SettingsModel.swift
//  hw13
//
//  Created by Panda on 09.06.2022.
//

import Foundation
import UIKit

class Model {
    static func getModel() ->[Sections] {
        var model = [Sections]()
        let optionsFirst: [SettingsOptonsType] = [
            .switchCell(model: SettingsSwitchOptons(
                title: Strings.airplaneTitle,
                icon: UIImage(systemName: Strings.airplaneIcon),
                iconBackgroundColor: .systemOrange,
                handler: { print("Нажата ячейка \($0)") },
                isOn: false
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.wifiTitle,
                icon: UIImage(systemName: Strings.wifiIcon),
                iconBackgroundColor: .systemBlue,
                handler: { print("Нажата ячейка \($0)") },
                detail: Strings.wifidetail,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.bluetoothTitle,
                icon: UIImage(named: Strings.bluetoothIcon),
                iconBackgroundColor: .systemBlue,
                handler: { print("Нажата ячейка \($0)") },
                detail: Strings.bluetoothDetail,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.netTitle,
                icon: UIImage(systemName: Strings.netIcon),
                iconBackgroundColor: .systemGreen,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.modemTitle,
                icon: UIImage(systemName: Strings.modemIcon),
                iconBackgroundColor: .systemGreen,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .switchCell(model: SettingsSwitchOptons(
                title: Strings.vpnTitle,
                icon: UIImage(named: Strings.vpnIcon),
                iconBackgroundColor: .systemBlue,
                handler: { print("Нажата ячейка \($0)") },
                isOn: true
            ))
        ]
        
        let optionsSecond: [SettingsOptonsType] = [
            .staticCell(model: SettingsOptons(
                title: Strings.alerTtitle,
                icon: UIImage(systemName: Strings.alertIcon),
                iconBackgroundColor: .systemRed,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.soundTitle,
                icon: UIImage(systemName: Strings.soundIcon),
                iconBackgroundColor: .systemRed,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.notDisurbTitle,
                icon: UIImage(systemName: Strings.notDisurbIcon),
                iconBackgroundColor: .systemIndigo,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.screenTimeTitle,
                icon: UIImage(systemName: Strings.screenTimeIcon),
                iconBackgroundColor: .systemIndigo,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            ))
        ]
        
        let optionsThird: [SettingsOptonsType] = [
            .staticCell(model: SettingsOptons(
                title: Strings.generalTitle,
                icon: UIImage(systemName: Strings.generalIcon),
                iconBackgroundColor: .systemGray,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: "1"
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.manageTitle,
                icon: UIImage(systemName: Strings.manageIcon),
                iconBackgroundColor: .systemGray,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.screenTitle,
                icon: UIImage(systemName: Strings.screenIcon),
                iconBackgroundColor: .systemBlue,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.homescreenTitle,
                icon: UIImage(named: Strings.homescreenIcon),
                iconBackgroundColor: .systemBlue,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            )),
            .staticCell(model: SettingsOptons(
                title: Strings.uaccesTitle,
                icon: UIImage(systemName: Strings.uaccesIcon),
                iconBackgroundColor: .systemBlue,
                handler: { print("Нажата ячейка \($0)") },
                detail: nil,
                notifications: nil
            ))
        ]
        model.append(Sections(title: "First", options: optionsFirst))
        model.append(Sections(title: "Second", options: optionsSecond))
        model.append(Sections(title: "Third", options: optionsThird))
        return model
    }
}

extension Model {
    enum Strings {
        static let airplaneTitle = "Авиарежим"
        static let airplaneIcon = "airplane"
        static let wifiTitle = "Wi-Fi"
        static let wifiIcon = "wifi"
        static let wifidetail = "Не подключено"
        static let bluetoothTitle = "Bluetooth"
        static let bluetoothIcon = "bluetooth"
        static let bluetoothDetail = "Вкл."
        static let netTitle = "Сотовая связь"
        static let netIcon = "antenna.radiowaves.left.and.right"
        static let modemTitle = "Режим модема"
        static let modemIcon = "personalhotspot"
        static let vpnTitle = "VPN"
        static let vpnIcon = "vpn"
        static let alerTtitle = "Уведомления"
        static let alertIcon = "bell.badge.fill"
        static let soundTitle = "Звуки, тактильные сигналы"
        static let soundIcon = "speaker.wave.3.fill"
        static let notDisurbTitle = "Не беспокоить"
        static let notDisurbIcon = "moon.fill"
        static let screenTimeTitle = "Экранное время"
        static let screenTimeIcon = "hourglass"
        static let generalTitle = "Основные"
        static let generalIcon = "gear"
        static let manageTitle = "Пункт управления"
        static let manageIcon = "switch.2"
        static let screenTitle = "Экран и яркость"
        static let screenIcon = "textformat.size"
        static let homescreenTitle = "Экран домой"
        static let homescreenIcon = "homescreen"
        static let uaccesTitle = "Универсальный доступ"
        static let uaccesIcon = "figure.wave.circle"
    }
}

struct SettingsOptons {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: ((String) -> Void)
    let detail: String?
    let notifications: String?
}

struct Sections {
    let title: String
    let options: [SettingsOptonsType]
    
    
}

struct SettingsSwitchOptons {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: ((String) -> Void)
    let isOn: Bool
}

enum SettingsOptonsType {
    case staticCell(model: SettingsOptons)
    case switchCell(model: SettingsSwitchOptons)
}

