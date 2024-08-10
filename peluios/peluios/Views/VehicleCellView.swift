//
//  VehicleCellView.swift
//  peluios
//
//  Created by Alejandro Aliaga on 10/8/24.
//

import UIKit

class VehicleCellView: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "VehicleCellView"

    private var vehicle: VehicleModel? {
        didSet {
            update()
        }
    }

    // MARK: - UI Components
    private lazy var bodyStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill

        return stack
    }()

    private lazy var labelName: UILabel = {
        let labelView = UILabel(frame: .zero)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = .systemFont(ofSize: 18)

        return labelView
    }()

    private lazy var labelModel: UILabel = {
        let labelView = UILabel(frame: .zero)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = .systemFont(ofSize: 18)

        return labelView
    }()

    private lazy var labelCapacity: UILabel = {
        let labelView = UILabel(frame: .zero)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = .systemFont(ofSize: 14)

        return labelView
    }()

    private lazy var labelCrew: UILabel = {
        let labelView = UILabel(frame: .zero)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = .systemFont(ofSize: 14)

        return labelView
    }()

    // MARK: - Initializers
    init(vehicle: VehicleModel? = nil) {
        self.vehicle = vehicle
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with vehicle: VehicleModel) {
        self.vehicle = vehicle
    }
}

// MARK: - UI Constraints
private extension VehicleCellView {
    func setupView() {
        setupBodyStack()
    }

    func update() {
        guard let vehicle else { return }
        labelName.text = vehicle.name
        labelModel.text = vehicle.model
        labelCrew.text = "Crew: \(vehicle.crew)"
        labelCapacity.text = "Capacity: \(vehicle.cargoCapacity)"
    }

    func setupBodyStack() {
        [labelName, labelModel, labelCrew, labelCapacity].forEach { [weak self] item in
            self?.bodyStack.addArrangedSubview(item)
        }

        contentView.addSubview(bodyStack)
        NSLayoutConstraint.activate([
            bodyStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            bodyStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bodyStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bodyStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
