import UIKit

struct Sections {
    let title: String
    let options: [SettingsOptonsType]
}

struct SettingsOptons {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: ((String) -> Void)
    let detail: String?
    let notifications: String?
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
