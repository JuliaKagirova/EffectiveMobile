//
//  ModalScreenVC.swift
//  EffectivaMobile
//
//  Created by Юлия Кагирова on 08.06.2024.
//

import UIKit

protocol ModalScreenViewControllerDelegate: AnyObject {
    func difficultRoutButtonTapped()
    func anywhereButtonTapped()
    func weekendButtonTapped()
    func hotTicketsButtonTapped()
}

class ModalScreenVC: UIViewController {
    
    //MARK: - Private Properties
    
    enum Section: Hashable {
        case buttons
    }
    enum Cell: Hashable {
        case buttons(button: ButtonsModel)
    }
    
    let buttonsModel: [ButtonsModel] = ButtonsModel.makeButtons()
    
    private lazy var zoomIcon: UIImageView = {
        var image = UIImageView().mask()
        image.clipsToBounds = true
        image.image = UIImage(named: "zoomIcon")
        return image
    }()
    
    private lazy var planeIcon: UIImageView = {
        let icon = UIImageView().mask()
        icon.clipsToBounds = true
        icon.image = UIImage(named: "plane")
        return icon
    }()
    
    private lazy var stackviewFromTo: UIStackView = {
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
    private var viewModel: ModalScreenVMProtocol
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Cell>
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Cell>
    private lazy var dataSource = makeDataSource()
    private var snapshot: Snapshot {
        dataSource.snapshot()
    }
    private var layoutConfiguration: UICollectionViewCompositionalLayoutConfiguration = {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(90)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        header.pinToVisibleBounds = true
        config.boundarySupplementaryItems = [header]
        
        return config
    }()
    private lazy var layout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
        guard let sections = self?.snapshot.sectionIdentifiers else { return nil }
        let section = sections[sectionIndex]
        switch section {
        case .buttons:
            return self?.setupButtonsLayout()
        }
    }, configuration: layoutConfiguration)
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).mask()
        collectionView.register(ButtonsCell.self,
                                forCellWithReuseIdentifier: ButtonsCell.identifier)
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        view.addSubview(collectionView)
        return collectionView
    }()
    
    init(viewModel: ModalScreenVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupCollectionView()
        
    }
    
    //MARK: - Private Methods
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: 168),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: -486)
        ])
    }
    
    private func setupStackView() {
        view.backgroundColor = .grey2
        
        view.addSubviews(stackviewFromTo, zoomIcon, planeIcon)
        stackviewFromTo.addSubviews(fromLabel, separator, toLabel)
        
        NSLayoutConstraint.activate([
            
            stackviewFromTo.topAnchor.constraint(equalTo: view.topAnchor,
                                                 constant: 46),
            stackviewFromTo.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                  constant: 16),
            stackviewFromTo.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                   constant: -16),
            stackviewFromTo.heightAnchor.constraint(equalToConstant: 96),
            
            
            zoomIcon.bottomAnchor.constraint(equalTo: stackviewFromTo.bottomAnchor,
                                             constant: -16),
            zoomIcon.leftAnchor.constraint(equalTo: stackviewFromTo.leftAnchor,
                                           constant: 16),
            zoomIcon.heightAnchor.constraint(equalToConstant: 24),
            zoomIcon.widthAnchor.constraint(equalToConstant: 24),
            
            fromLabel.topAnchor.constraint(equalTo: stackviewFromTo.topAnchor,
                                           constant: 16),
            
            fromLabel.leftAnchor.constraint(equalTo: stackviewFromTo.leftAnchor,
                                            constant: 48),
            fromLabel.heightAnchor.constraint(equalToConstant: 21),
            
            planeIcon.leftAnchor.constraint(equalTo: stackviewFromTo.leftAnchor,
                                            constant: 16),
            planeIcon.heightAnchor.constraint(equalToConstant: 24),
            planeIcon.widthAnchor.constraint(equalToConstant: 24),
            planeIcon.topAnchor.constraint(equalTo: stackviewFromTo.topAnchor,
                                           constant: 16),
            
            toLabel.topAnchor.constraint(equalTo: stackviewFromTo.topAnchor,
                                         constant: 56),
            toLabel.leftAnchor.constraint(equalTo: stackviewFromTo.leftAnchor,
                                          constant: 48),
            toLabel.heightAnchor.constraint(equalToConstant: 21),
            
            separator.topAnchor.constraint(equalTo: stackviewFromTo.topAnchor,
                                           constant: 48),
            separator.widthAnchor.constraint(equalToConstant: 296),
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.leftAnchor.constraint(equalTo: stackviewFromTo.leftAnchor,
                                            constant: 16),
            separator.rightAnchor.constraint(equalTo: stackviewFromTo.rightAnchor,
                                             constant: -16)
        ])
    }
    
    private func setupButtonsLayout() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(90)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(90)
        )
      
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        return section
    }
    
    
    private func makeDataSource() -> DataSource {
        return DataSource(collectionView: collectionView) {
            collectionView,
            indexPath,
            itemIdentifier in
            switch itemIdentifier {
            case .buttons(let model):
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ButtonsCell.identifier,
                    for: indexPath) as? ButtonsCell
                else { 
                    return UICollectionViewCell()
                }
                cell.configuredCell(button: model)
                return cell
            }
        }
    }
}
    // MARK: - Event Handlers
    
extension ModalScreenVC: UITextFieldDelegate {
        
    }

extension ModalScreenVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = dataSource.itemIdentifier(for: indexPath) else { return }
        switch cell {
        case .buttons(let button):
            viewModel.didTappedButton(target: button.target)
            
        }
    }
}
extension ModalScreenVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        buttonsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}
