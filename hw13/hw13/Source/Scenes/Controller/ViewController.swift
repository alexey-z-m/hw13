import UIKit

class ViewController: UIViewController {
    
    var model: SettingsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view = SettingsView()
        model = SettingsModel()
        configureView()
    }
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else {return nil}
        return view as? SettingsView
    }
}
private extension ViewController {
    func configureView() {
        guard let models = model?.getModel() else { return }
        settingsView?.configureView(with: models)
    }
}
