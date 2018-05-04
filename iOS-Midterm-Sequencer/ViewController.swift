//
//  ViewController.swift
//  iOS-Midterm-Sequencer
//
//  Created by Alejandro Zielinsky on 2018-05-03.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gridManager = GridManager()
        gridManager.createGrid()
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
//        mainStackView.distribution = .fillEqually
//        mainStackView.alignment = .fill
        mainStackView.spacing = 5
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0..<gridManager.gridX
        {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
//            rowStackView.distribution = .fillEqually
//            rowStackView.alignment = .fill
            rowStackView.spacing = 5
            rowStackView.translatesAutoresizingMaskIntoConstraints = false
            
            for j in 0..<gridManager.gridY
            {
                // add each cell to the row stackview
                rowStackView.addArrangedSubview(gridManager.grid[i][j])
                gridManager.grid[i][j].widthAnchor.constraint(equalToConstant: 40).isActive = true
                gridManager.grid[i][j].heightAnchor.constraint(equalToConstant: 40).isActive = true
            }
            // add row to main stackview
            mainStackView.addArrangedSubview(rowStackView)
        }
        // add main stackview to self.view as a subview
        self.view.addSubview(mainStackView)
        // main stackview center horizontally and vertically
        mainStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    @IBAction func ToggleGridCell(_ sender: GridCell)
    {
        sender.toggleCell()
    }
    
}

