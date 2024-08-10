//
//  ViewController.swift
//  peluios
//
//  Created by Alejandro Aliaga on 7/27/24.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    private var vehicles: [VehicleModel] = []
    var vehicleUrl: [URL] = []

    // MARK: - UI Components
    private lazy var labelView: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "SWAPI Test App"
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false

        debugPrint("UILabel Titulo se ha creado!")
        return label
    }()

    private lazy var searchContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var characterHeightLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var characterHairColorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var characterGenderLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var searchTextField: UITextField = {
        let textView = UITextField(frame: .zero)
        textView.placeholder = "User ID"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.borderStyle = .roundedRect

        debugPrint("UITextField UserID se ha creado!")
        return textView
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buscar", for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(searchButtonTap), for: .touchUpInside)

        debugPrint("UIButton Buscar se ha creado!")
        return button
    }()
    
    private lazy var searchVehiculeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check it related vehicules", for: .normal)
        button.isUserInteractionEnabled = true
        button.center = self.view.center
        button.isHidden = true
        button.addTarget(self, action: #selector(searchForVehiculeButtonTap), for: .touchUpInside)
        
        return button
    }()
    
    private func firstList() -> UICollectionView  {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
             configuration.headerMode = .supplementary
             let layout = UICollectionViewCompositionalLayout.list(using: configuration)
             let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
             view.backgroundColor = .systemBackground
             view.translatesAutoresizingMaskIntoConstraints = false
             return view
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        debugPrint("UIImageView se ha creado!")
        return imageView
    }()

    private let vehicleCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewLayout()
        )
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .zero

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .blue
        collectionView.register(
            VehicleCellView.self,
            forCellWithReuseIdentifier: VehicleCellView.identifier
        )
        collectionView.isHidden = true

        return collectionView
    }()

    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UI Methods
extension MainViewController {
    func setupUI() {
        setupBackground()
        setupLabelView()
        setupControlsContainer()
        setupSearchTextField()
        setupSearchButton()
        setupImageView()
        setupCharacterNameLabel()
        setupCharacterHeightLabel()
        setupCharacterHairColorLabel()
        setupCharacterGenderLabel()
        setupSearchVehiculeButton()
        setupCollectionView()
    }

    func setupBackground() {
        self.view.backgroundColor = .white
    }
    
    func setupLabelView() {
        self.view.addSubview(labelView)
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    func setupControlsContainer() {
        self.view.addSubview(searchContainer)
        NSLayoutConstraint.activate([
            searchContainer.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 10),
            searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchContainer.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupSearchTextField() {
        self.searchContainer.addSubview(searchTextField)
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: searchContainer.topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 10)
        ])
    }

    func setupSearchButton() {
        self.searchContainer.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: searchContainer.topAnchor),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10)
        ])
    }

    func setupImageView() {
        self.view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 2),
            imageView.widthAnchor.constraint(equalToConstant: 150), // Adjust as needed
            imageView.heightAnchor.constraint(equalToConstant: 150) // Adjust as needed
        ])
    }
    
    func setupCharacterNameLabel(){
        self.view.addSubview(characterNameLabel)
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            characterNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            characterNameLabel.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10)
        ])
    }
    
    func setupCharacterHeightLabel(){
        self.view.addSubview(characterHeightLabel)
        NSLayoutConstraint.activate([
            characterHeightLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 10),
            characterHeightLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            characterHeightLabel.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10)
        ])
    }
    
    func setupCharacterHairColorLabel(){
        self.view.addSubview(characterHairColorLabel)
        NSLayoutConstraint.activate([
            characterHairColorLabel.topAnchor.constraint(equalTo: characterHeightLabel.bottomAnchor, constant: 10),
            characterHairColorLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            characterHairColorLabel.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10)
        ])
    }
    
    func setupCharacterGenderLabel(){
        self.view.addSubview(characterGenderLabel)
        NSLayoutConstraint.activate([
            characterGenderLabel.topAnchor.constraint(equalTo: characterHairColorLabel.bottomAnchor, constant: 10),
            characterGenderLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            characterGenderLabel.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10)
        ])
    }
    
    func setupSearchVehiculeButton(){
        self.view.addSubview(searchVehiculeButton)
        NSLayoutConstraint.activate([
            searchVehiculeButton.topAnchor.constraint(equalTo: characterGenderLabel.bottomAnchor, constant: 10),
            searchVehiculeButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            searchVehiculeButton.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10)
        ])
    }

    func setupCollectionView() {
        self.view.addSubview(vehicleCollectionView)
        NSLayoutConstraint.activate([
            vehicleCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            vehicleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vehicleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vehicleCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - Events
private extension MainViewController {
    @objc
    func searchButtonTap() {
        Task {
            let service = SwapiNetworkService()
            let imageService = ImageService()

            let characterId = self.searchTextField.text ?? ""
            guard let image = ImagesManager.images[characterId] else {
                return
            }

            // Opción 1: Task grupal
            async let characterRequest = await service.loadData(id: characterId)
            async let imageRequest = await imageService.loadImageFromURL(image)

            let (characterResponse, imageResponse) = await (characterRequest, imageRequest)

            // Opción 2: Task individuales
            //let response = await service.loadData(id: characterId)
            //let characterImage = await imageService.loadImageFromURL(image)

            guard let characterResponse, let imageResponse else {
                return
            }

            DispatchQueue.main.async { [weak self] in
                self?.characterNameLabel.text = characterResponse.name
                self?.characterHeightLabel.text = characterResponse.height
                self?.characterHairColorLabel.text = characterResponse.hairColor
                self?.characterGenderLabel.text = characterResponse.gender
                self?.vehicleUrl = characterResponse.vehicles
                self?.imageView.image = UIImage(data: imageResponse)
                self?.searchVehiculeButton.isHidden = false
            }

            debugPrint("Respuesta: \(String(describing: characterResponse))")
        }
    }

    @objc
    func searchForVehiculeButtonTap() {
        Task {
            let service = SwapiNetworkService()
            //let response = await service.loadVehiculeData(vehicleUrl: vehiculeUrl[0])
            //debugPrint("Vehiculo: \(String(describing: response))")

            // TODO: Crear task grupal y obtener todos los vehículos
            // Refs: https://www.hackingwithswift.com/quick-start/concurrency/whats-the-difference-between-await-and-async-let
            // Refs: https://medium.com/axel-springer-tech/async-let-and-taskgroup-in-swift-a4e22edffbe6
        }
    }
}

// MARK: - UICollectionView Delegates
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vehicles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: VehicleCellView.identifier,
            for: indexPath) as? VehicleCellView else {
            return UICollectionViewCell()
        }

        let vehicle = vehicles[indexPath.row]
        cell.configure(with: vehicle)

        return cell
    }
}
