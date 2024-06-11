//
//  ButtonsCell.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 10.06.2024.
//

import UIKit

final class ButtonsCell: UICollectionViewCell {
    
    //MARK: - Enum
    
    
    private enum Constants {
        // Generic layout constants
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let contentViewCornerRadius: CGFloat = 10
        static let imageHeight: CGFloat = 48
    }
    
    
    enum SizeButtons {
        static let imageSize: CGFloat = 48
    }
    
    //MARK: - Private Properties
    
    weak var delegate: ModalScreenViewControllerDelegate?
    
    private lazy var image: UIImageView = {
        let view = UIImageView(frame: .zero).mask()
        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero).mask()
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
        setupView()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .purple
    }
    
    private func setupSubviews() {
        contentView.addSubview(image)
        contentView.addSubview(label)
    }
    
    func configuredCell(button: ButtonsModel) {
        image.image = button.icon
        label.text = button.title
        
//        switch button.target {
//        case .difficultRout:
//            layer.cornerRadius = 10
//            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        case .hotTickets:
//            layer.cornerRadius = 10
//            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//            NSLayoutConstraint.activate([
//                image.bottomAnchor.constraint(
//                    equalTo: bottomAnchor,
//                    constant: -16
//                )
//            ])
//        default:
//            break
//        }
    }
    
    //MARK: - Private Methods
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
//            image.topAnchor.constraint(equalTo: topAnchor),
//            image.leadingAnchor.constraint(equalTo: leadingAnchor,
//                                           constant: 11),
//            image.heightAnchor.constraint(equalToConstant: SizeButtons.imageSize),
//            image.widthAnchor.constraint(equalToConstant: SizeButtons.imageSize),
//            //            label.centerXAnchor.constraint(equalTo: image.centerXAnchor),
//            label.leadingAnchor.constraint(equalTo: leftAnchor),
//            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8 )
//        ])
        
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        image.topAnchor.constraint(equalTo: contentView.topAnchor),
        image.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
        
        
        label.centerXAnchor.constraint(
            equalTo: image.centerXAnchor),
        label.topAnchor.constraint(
            equalTo: image.bottomAnchor,
            constant: Constants.verticalSpacing),
        ])
        
    }
   
    //MARK: - Event Handlers
    
    @objc private func difficultRoutButtonTapped() {
        delegate?.difficultRoutButtonTapped()
    }
    @objc private func anywhereButtonTapped() {
        delegate?.anywhereButtonTapped()
    }
    @objc private func weekendButtonTapped() {
        delegate?.weekendButtonTapped()
    }
    @objc private func hotTicketsButtonTapped() {
        delegate?.hotTicketsButtonTapped()
    }
}
