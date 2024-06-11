//
//  AirTicketsVC.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit

class AirTicketsVC: UIViewController {
    
    //MARK: - Private Properties
    
    let viewModel: AirTicketsVM
    //    var coordinator: AirTicketsBaseCoordinator?
    
    //    private lazy var goToHome2button: UIButton = {
    //        let btn = UIButton().mask()
    //        btn.setTitle("Go to Detail Home", for: .normal)
    //        btn.layer.borderColor = UIColor.black.cgColor
    //        btn.layer.borderWidth = 2
    //        btn.backgroundColor = .black
    //        btn.addTarget(self, action: #selector(goToHome2), for: .touchUpInside)
    //        return btn
    //    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel().mask()
        label.text = "Поиск дешевых авиабилетов"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .grey7
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var bgView: UIView = {
        let view = UIView().mask()
        view.backgroundColor = .grey3
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        var image = UIImageView().mask()
        image.clipsToBounds = true
        image.image = UIImage(named: "zoomIcon")
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView().mask()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.backgroundColor = .grey4
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 20
        return stack
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView().mask()
        separator.backgroundColor = .grey6
        return separator
    }()
    
    private lazy var fromLabel: UITextField = {
        let label = UITextField().mask()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        label.leftViewMode = .always
        label.keyboardType = .emailAddress
        label.autocapitalizationType = .none
        label.clearButtonMode = UITextField.ViewMode.whileEditing
        label.returnKeyType = .done
        label.delegate = self
        return label
    }()
    
    private lazy var toLabel: UITextField = {
        let label = UITextField().mask()
        label.text = "Куда - Турция"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.textColor = .grey6
        label.leftViewMode = .always
        label.keyboardType = .emailAddress
        label.autocapitalizationType = .none
        label.clearButtonMode = UITextField.ViewMode.whileEditing
        label.returnKeyType = .done
        label.delegate = self
        return label
    }()
    
    private lazy var secondaryLabel: UILabel = {
        let label = UILabel().mask()
        label.text = "Музыкально отлететь"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - Life Cycle
    
    init(viewModel: AirTicketsVM) {
        self.viewModel = viewModel
        //        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        modalWindow()
    }
    
    //MARK: - Private Methods
    
    private func setupUI() {
        //        view.addSubview(goToHome2button)
        
        view.addSubviews(titleLabel, bgView, stackView, iconImage, secondaryLabel)
        stackView.addSubviews(fromLabel, separator, toLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: 58),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,
                                             constant: 90),
            titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                              constant: -82),
            bgView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                        constant: 38),
            bgView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                         constant: 16),
            bgView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                          constant: -16),
            bgView.heightAnchor.constraint(equalToConstant: 122),
            
            stackView.topAnchor.constraint(equalTo: bgView.topAnchor,
                                           constant: 16),
            stackView.leftAnchor.constraint(equalTo: bgView.leftAnchor,
                                            constant: 16),
            stackView.rightAnchor.constraint(equalTo: bgView.rightAnchor,
                                             constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor,
                                              constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 90),
            
            iconImage.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            iconImage.leftAnchor.constraint(equalTo: stackView.leftAnchor,
                                            constant: 8),
            iconImage.heightAnchor.constraint(equalToConstant: 24),
            iconImage.widthAnchor.constraint(equalToConstant: 24),
            
            fromLabel.topAnchor.constraint(equalTo: stackView.topAnchor,
                                           constant: 16),
            
            fromLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor,
                                            constant: 49),
            fromLabel.heightAnchor.constraint(equalToConstant: 21),
            
            toLabel.topAnchor.constraint(equalTo: stackView.topAnchor,
                                         constant: 53),
            toLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor,
                                          constant: 49),
            toLabel.heightAnchor.constraint(equalToConstant: 21),
            
            separator.topAnchor.constraint(equalTo: stackView.topAnchor,
                                           constant: 45),
            separator.widthAnchor.constraint(equalToConstant: 232),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leftAnchor.constraint(equalTo: stackView.leftAnchor,
                                            constant: 48),
            separator.rightAnchor.constraint(equalTo: stackView.rightAnchor,
                                             constant: -16),
            
            secondaryLabel.topAnchor.constraint(equalTo:bgView.bottomAnchor,
                                                constant: 32),
            secondaryLabel.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                 constant: 16),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 26),
            
            
            
            //            goToHome2button.centerXAnchor.constraint(equalTo: view.centerXAnchor,
//            constant: 36),
            //            goToHome2button.centerYAnchor.constraint(equalTo: view.centerYAnchor,
//            constant: 37)
        ])
    }
    
    private func modalWindow() {
        
        let tapGesture = UITapGestureRecognizer(
        target: self,
        action: #selector(didTapOnModalWindow)
        )
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        toLabel.isUserInteractionEnabled = true
        toLabel.addGestureRecognizer(tapGesture)
    }
    //MARK: - Event Handlers
    
    //    @objc private func goToHome2() {
    //        viewModel.onDetail?()
    //    }
    
    @objc func didTapOnModalWindow() {
        print("tapped on modal window")
        //open modal window
        let modalVC = ModalScreenVC(viewModel: ModalScreenVM())
        self.present(modalVC, animated: true, completion: nil)
    }
}

extension AirTicketsVC: UITextFieldDelegate {}
