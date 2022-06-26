//
//  ViewController.swift
//  ColorSchemeChangingMVVM
//
//  Created by Екатерина Неделько on 26.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    private var colorSchemeSegmentedControl = UISegmentedControl()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.setupColorSchemeSegmentedControl()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureLayout()
    }

}

private extension ViewController {
    private func setupColorSchemeSegmentedControl() {
        for (index, item) in viewModel.getColorSchemesItems().enumerated() {
            colorSchemeSegmentedControl.insertSegment(action: UIAction(title: item) { [weak self] _ in self?.changeSelectedSegmentIndex(index) },
                                                      at: index,
                                                      animated: true)
        }
        
        colorSchemeSegmentedControl.selectedSegmentIndex = 0
        changeSelectedSegmentIndex(colorSchemeSegmentedControl.selectedSegmentIndex)
    }
    
    private func changeSelectedSegmentIndex(_ index: Int) {
        viewModel.selectSegmentIndex(index) { scheme in
            self.setupAppearance(scheme)
        }
    }
    
    func setupAppearance(_ scheme: ColorSchemeType) {
        view.backgroundColor = scheme.backgroundColor
        colorSchemeSegmentedControl.backgroundColor = scheme.additionalColor
    }
    
    func addSubviews() {
        view.addSubview(colorSchemeSegmentedControl)
    }
    
    func configureLayout() {
        colorSchemeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorSchemeSegmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            colorSchemeSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.bounds.width / 5),
            colorSchemeSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colorSchemeSegmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height / 15)
            
        ])
    }
}
