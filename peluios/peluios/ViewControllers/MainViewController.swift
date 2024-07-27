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
}

// MARK: - Events
private extension MainViewController {
    @objc
    func searchButtonTap() {
        Task {
            let service = SwapiNetworkService()
            let response = await service.loadData(id: self.searchTextField.text ?? "")

            debugPrint("Respuesta: \(response)")
        }
    }
}

