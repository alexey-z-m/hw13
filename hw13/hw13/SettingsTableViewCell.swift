import UIKit

class SettingsTableViewCell: UITableViewCell {
    static let identifier = "SettingsTableViewCell"
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        return view
    }()
    
    private let notificationsContainer: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemRed
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.numberOfLines = 1
        return label
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .right
        label.textColor = .systemGray
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(notificationsContainer)
        contentView.addSubview(iconContainer)
        contentView.addSubview(subLabel)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.frame.size.height - 12
        notificationsContainer.frame = CGRect(
            x: contentView.frame.size.width - notificationsContainer.frame.size.width - 15,
            y: 6,//size - 20,
            width: size,
            height: size)
        notificationsContainer.layer.cornerRadius = size / 2
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        subLabel.frame = CGRect(
            x: contentView.frame.size.width - subLabel.frame.size.width - 10,
            y: 0,
            width: contentView.frame.size.width - 15 - iconContainer.frame.size.width - 10,
            height: contentView.frame.size.height
        )
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 15 - iconContainer.frame.size.width - 10,
            height: contentView.frame.size.height
        )
        self.separatorInset = UIEdgeInsets(
            top: 0,
            left: 25 + iconContainer.frame.size.width,
            bottom: 0,
            right: 0
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        subLabel.text = nil
        label.text = nil
        iconImageView.backgroundColor = nil
        notificationsContainer.backgroundColor = nil
    }
    
    public func configure(with model: SettingsOptons) {
        label.text = model.title
        subLabel.text = model.detail
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        notificationsContainer.text = model.notifications
        if model.notifications != nil {
            notificationsContainer.backgroundColor = .systemRed
        } else {
            notificationsContainer.backgroundColor = nil
        }
        
    }
}

