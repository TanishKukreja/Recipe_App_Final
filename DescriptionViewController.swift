//
//  DescriptionViewController.swift
//  Recipe_App_Final
//
//  Created by Tanish_MAC on 07/03/23.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    var containerView = UIView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        self.view.addSubview(containerView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        containerView.backgroundColor = .white
        containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant:  0).isActive = true
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant:  -30).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.backgroundColor = .white
        titleLabel.font = UIFont(name: "Helvetica Neue", size: 30)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant:  -30).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        descriptionLabel.backgroundColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "GILLSANSCE-ROMAN", size: 30)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
