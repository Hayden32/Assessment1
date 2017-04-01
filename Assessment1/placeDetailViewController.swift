//
//  placeDetailViewController.swift
//  Assessment1
//
//  Created by Hayden Hastings on 4/1/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class placeDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var place: Place?

    @IBOutlet weak var placeNameTextField: UITextField!
    @IBOutlet weak var reasonwhyTextView: UITextView!

    func clearText() {
        placeNameTextField.text = ""
        reasonwhyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let placeName = placeNameTextField.text,
            let reasonToGo = reasonwhyTextView.text {
            PlaceController.shared.addPlaceWithName(name: placeName, reasonToGo: reasonToGo)
            
            let nc = navigationController?.popViewController(animated: true)
            clearText()
        }
        
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        clearText()
    }
}
