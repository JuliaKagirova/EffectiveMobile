//
//  AirTicketsDetailVC.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit

class AirTicketsDetailVC: UIViewController {
    
    let viewModel: AirTicketsDetailVM
    
    private lazy var goToFavoriteButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go to order tab", for: .normal)
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(goToOrderTab), for: .touchUpInside)
        return btn
    }()
    
    init(viewModel: AirTicketsDetailVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Detail Home"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(goToFavoriteButton)
        
        NSLayoutConstraint.activate([
            goToFavoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToFavoriteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func goToOrderTab() {
        viewModel.onClose?()
    }
}
