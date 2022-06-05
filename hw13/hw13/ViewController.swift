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
    let options: [SettingsOptons]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        return table
    }()
    
    var models = [Sections]()
    
    var options: [SettingsOptons] = [
        SettingsOptons(
            title: "Wi-Fi",
            icon: UIImage(systemName: "wifi"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            detail: "Не подключено",
            notifications: nil
        ),
        SettingsOptons(
            title: "Bluetooth",
            icon: UIImage(named: "bluetooth"),
            iconBackgroundColor: .systemBlue,
            handler: { print("Нажата ячейка \($0)") },
            detail: "Вкл.",
            notifications: nil
        ),
        SettingsOptons(
            title: "Основные",
            icon: UIImage(systemName: "gear"),
            iconBackgroundColor: .systemGray,
            handler: { print("Нажата ячейка \($0)") },
            detail: nil,
            notifications: "1"
        )
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
        models.append(Sections(title: "First", options: options))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsTableViewCell.identifier,
            for: indexPath
        ) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

