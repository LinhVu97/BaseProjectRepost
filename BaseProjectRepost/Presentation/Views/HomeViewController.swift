//
//  HomeViewController.swift
//  BaseProjectRepost
//
//  Created by Linh Vu on 10/12/24.
//

import UIKit
import Stevia

class HomeViewController: UIViewController {
    var coordinator: AppCoordinator?
    
    private var  getCategoryUseCase: GetCategoryUseCase?
    
    var categories: [CategoryEntity] = []
    
    private lazy var changeViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        fetchCategory()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        setupUI()
        setupContrainst()
        
        let categoryReposity = CategoryRepositoryImpl()
        getCategoryUseCase = GetCategoryUseCase(categoryRepository: categoryReposity)
    }
    
    private func fetchCategory() {
        getCategoryUseCase?.execute { [weak self] result in
            switch result {
            case .success(let categories):
                self?.categories = categories
                print(categories)
            case .failure:
                print("Error")
            }
        }
    }
    
    private func setupUI() {
        changeViewButton.style {
            $0.setTitle("Change", for: .normal)
            $0.backgroundColor = .blue
            $0.addTarget(self, action: #selector(didTapChangeView), for: .touchUpInside)
        }
        
        view.subviews {
            changeViewButton
        }
        
    }
    
    private func setupContrainst() {
        changeViewButton.Top == view.safeAreaLayoutGuide.Top + 30
        changeViewButton.Height == 50
        changeViewButton.CenterX == view.CenterX
    }
    
    @objc private func didTapChangeView() {
        coordinator?.changeView(view: self)
        print("change")
    }
}
