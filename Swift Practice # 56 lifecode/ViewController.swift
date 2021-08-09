//
//  ViewController.swift
//  Swift Practice # 56 lifecode
//
//  Created by CHEN PEIHAO on 2021/8/9.
//

import UIKit

class ViewController: UIViewController {
    //date picker的outlet
    @IBOutlet weak var dateSelectDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func showResult(_ coder: NSCoder) -> showResultViewController? {
        //讓showResultViewController(coder: coder)指派為controller
        let controller = showResultViewController(coder: coder)
        //第二頁的（var birthday: Date!）
        //會由第一頁datepicker生日選擇後決定並return controller
        controller?.birthday = dateSelectDatePicker.date
        return controller
    }
    
}

