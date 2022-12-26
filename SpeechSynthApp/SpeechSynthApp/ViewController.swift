//
//  ViewController.swift
//  SpeechSynthApp
//
//  Created by Namik Karabiyik on 22.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblPrerecords: UITableView!
    @IBOutlet weak var viewMiddle: UIView!
    @IBOutlet weak var pickerOptions: UIPickerView!
    @IBOutlet weak var btnSpeechSettings: UIButton!
    @IBOutlet weak var btnSpeak: UIButton!
    @IBOutlet weak var txtSpeech: UITextField!
    @IBOutlet weak var lblHeader: UILabel!
    var sounds:[String]?
    var languages:[String]?
    
    lazy var viewModel:ViewControllerViewModel =
    {
        var viewModelData = ViewControllerViewModel()
        languages =  viewModelData.getLanguages()
        sounds = viewModelData.getSounds()
        return viewModelData
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerOptions.delegate = self
        pickerOptions.dataSource = self
        
        tblPrerecords.delegate = self
        tblPrerecords.dataSource = self
        
    }


}
//MARK: Start of tableView delegtes
extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}

extension ViewController: UITableViewDelegate
{
    
}
//MARK: end of tableView delegates
//MARK: --------------------------
//MARK: Start of pickerView delegates
extension ViewController:UIPickerViewDelegate
{
    
}

extension ViewController:UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    }
    
    
}
//MARK: End of pickerView delegates

