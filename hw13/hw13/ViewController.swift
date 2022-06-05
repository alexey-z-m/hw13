import UIKit

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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Sections]()
    var optionsFirst: [SettingsOptonsType] = [
        .switchCell(model: SettingsSwitchOptons(
            title: "Авиарежим",
            icon: UIImage(systemName: "airplane"),
            iconBackgroundColor: .systemOrange,
            handler: { print("Нажата ячейка \($0)") },
            isOn: false
        )),
        .staticCell(model: SettingsOptons(
            title: "Wi-Fi",
            icon: UIImage(systemName: "wifi"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            detail: "Не подключено",
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Bluetooth",
            icon: UIImage(named: "bluetooth"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            detail: "Вкл.",
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Сотовая связь",
            icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
            iconBackgroundColor: .systemGreen,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Режим модема",
            icon: UIImage(systemName: "personalhotspot"),
            iconBackgroundColor: .systemGreen,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .switchCell(model: SettingsSwitchOptons(
            title: "VPN",
            icon: UIImage(named: "vpn"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            isOn: true
        ))
    ]
    
    var optionsSecond: [SettingsOptonsType] = [
        .staticCell(model: SettingsOptons(
            title: "Уведомления",
            icon: UIImage(systemName: "bell.badge.fill"),
            iconBackgroundColor: .systemRed,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Звуки, тактильные сигналы",
            icon: UIImage(systemName: "speaker.wave.3.fill"),
            iconBackgroundColor: .systemRed,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Не беспокоить",
            icon: UIImage(systemName: "moon.fill"),
            iconBackgroundColor: .systemIndigo,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Экранное время",
            icon: UIImage(systemName: "hourglass"),
            iconBackgroundColor: .systemIndigo,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        ))
    ]
    
    var optionsThird: [SettingsOptonsType] = [
        .staticCell(model: SettingsOptons(
            title: "Основные",
            icon: UIImage(systemName: "gear"),
            iconBackgroundColor: .systemGray,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: "1"
        )),
        .staticCell(model: SettingsOptons(
            title: "Пункт управления",
            icon: UIImage(systemName: "switch.2"),
            iconBackgroundColor: .systemGray,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Экран и яркость",
            icon: UIImage(systemName: "textformat.size"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Экран домой",
            icon: UIImage(named: "homescreen"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        )),
        .staticCell(model: SettingsOptons(
            title: "Универсальный доступ",
            icon: UIImage(systemName: "figure.wave.circle"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: nil
        ))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.addSubview(tableView)
        title = "Настройки"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        models.append(Sections(title: "First", options: optionsFirst))
        models.append(Sections(title: "Second", options: optionsSecond))
        models.append(Sections(title: "Third", options: optionsThird))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.identifier,
                for: indexPath
            ) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
        case .staticCell(let model):
            model.handler(model.title)
        case .switchCell(let model):
            model.handler(model.title)
        }
    }
}
