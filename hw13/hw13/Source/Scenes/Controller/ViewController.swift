import UIKit

class ViewController: UIViewController {
    
    var model: SettingModel?
    var models = [Sections]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        model = SettingModel()
        view = SettingsView()
        configureView()
    }
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else {return nil}
        return view as? SettingsView
    }
}

extension ViewController {
    func configureView() {
        guard let models = model?.getModel() else { return }
        self.models = models
        settingsView?.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
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
}

extension ViewController: UITableViewDelegate {
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

