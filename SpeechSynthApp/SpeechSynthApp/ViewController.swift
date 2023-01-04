//
//  ViewController.swift
//  SpeechSynthApp
//
//  Created by Namik Karabiyik on 22.12.2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var viewMain: UIView!
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
    let headerCell = UINib(nibName: "HeaderCell",
                           bundle: nil)
    let contentCell = UINib(nibName: "ContentCell", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerOptions.delegate = self
        pickerOptions.dataSource = self
        
        tblPrerecords.delegate = self
        tblPrerecords.dataSource = self
        
        pickerOptions.isHidden = true
        lblHeader.textAlignment = .center
        lblHeader.text = "Welcome To Speech App"
        let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        viewMain.addGestureRecognizer(dismissGesture)
        viewMain.isUserInteractionEnabled = true
        
        
        self.tblPrerecords.register(headerCell,forCellReuseIdentifier: "HeaderCell")
        self.tblPrerecords.register(contentCell, forCellReuseIdentifier: "ContentCell")
        setUIButtons()
    }
    
    func setUIButtons()
    {
        btnSpeak.addTarget(self, action:#selector(btnSpeakClicked), for: .touchDown)
        btnSpeechSettings.addTarget(self, action: #selector(btnSettingsClicked), for: .touchDown)
        
    }
    
    @objc func btnSpeakClicked()
    {
        viewModel.speak(whatToSay: txtSpeech.text ?? "Hello", inWhatLanguage: viewModel.currentLanguage)
    }
    @objc func btnSettingsClicked()
    {
        if pickerOptions.isHidden
        {
            pickerOptions.isHidden = false
            return
        }
        pickerOptions.isHidden = true
        
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
        
    //    if pickerOptions.isHidden
    //    {
    //        pickerOptions.isHidden = false
    //        return
    //    }
        pickerOptions.isHidden = true
    }


}
//MARK: Start of tableView delegtes
extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.section == 0
        {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? HeaderCell
            {
                cell.lblHeader.text = "Preset sesler"
                cell.lblHeader.textAlignment = .center
                cell.selectionStyle = .none
                return cell
             }
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as? ContentCell
        {
            
            return cell
        }
        return BaseTVCell()
        
      
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
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return languages?[row]
        }
        return sounds?[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.currentLanguage = languages?[row] ?? ""
        print(languages?[row])
    }
}

extension ViewController:UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if component == 0
        {
            return viewModel.getLanguageCount()
        }
        return viewModel.getSoundCount()
    }
   
    
    
}
//MARK: End of pickerView delegates

