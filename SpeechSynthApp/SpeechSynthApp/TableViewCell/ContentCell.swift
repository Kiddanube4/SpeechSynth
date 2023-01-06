//
//  ContentCell.swift
//  SpeechSynthApp
//
//  Created by Namik Karabiyik on 23.12.2022.
//

import UIKit

class ContentCell: BaseTVCell {

    @IBOutlet weak var lblPresetSoundLang: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var lblPresetSoundName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("Content cell awoken")
    }
    
    var contentCellViewModel:SpeechSynthModel?
    {
        didSet
        {
            lblPresetSoundName.text = contentCellViewModel?.presetSoundName
            lblPresetSoundLang.text = contentCellViewModel?.presetSoundLang
            lblPresetSoundName.numberOfLines = 0
            
        }
    }

    @IBAction func btnPlayClicked(_ sender: UIButton)
    {
        
    }
    
}
