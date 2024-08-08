//
//  ViewController.swift
//  peluios
//
//  Created by Alejandro Aliaga on 7/27/24.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
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
//MARK: -test
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
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        debugPrint("UIImageView se ha creado!")
        return imageView
    }()

    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UI Methods
private extension MainViewController {
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

    func loadImageFromURL(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            debugPrint("Invalid URL string.")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                debugPrint("Error loading image: \(error)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                debugPrint("Error: No data or data is not a valid image.")
                return
            }

            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }.resume()
    }
}

var vehiculeUrl: [URL] = []

// MARK: - Events
private extension MainViewController {
    @objc
  
    func searchButtonTap() {
        Task {
            let service = SwapiNetworkService()
            let characterId = self.searchTextField.text ?? ""
            let response = await service.loadData(id: characterId)
            guard let image = ImagesManager.images[characterId] else {
                return
            }
            loadImageFromURL(image)
            if let character = response {
                DispatchQueue.main.async {
                    self.characterNameLabel.text = character.name;
                    self.characterHeightLabel.text = character.height;
                    self.characterHairColorLabel.text = character.hairColor;
                    self.characterGenderLabel.text = character.gender;
                    vehiculeUrl = character.vehicles;
                }
            }
            
            self.searchVehiculeButton.isHidden = false
            
            debugPrint("Respuesta: \(String(describing: response))")
        }
    }
    @objc
    func searchForVehiculeButtonTap() {
        
        Task {
            let service = SwapiNetworkService()
            let response = await service.loadVehiculeData(vehicleUrl: vehiculeUrl[0])
            
            debugPrint("Vehiculo: \(String(describing: response))")
        }
    }
}
