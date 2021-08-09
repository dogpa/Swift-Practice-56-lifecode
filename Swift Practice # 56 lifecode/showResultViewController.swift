//
//  showResultViewController.swift
//  Swift Practice # 56 lifecode
//
//  Created by CHEN PEIHAO on 2021/8/9.
//

import UIKit
//使用webkit功能
import WebKit

class showResultViewController: UIViewController {

    //顯示網站
    @IBOutlet weak var lifecodeWebView: WKWebView!
    //顯示生命靈數數字
    @IBOutlet weak var lifecodeLabel: UILabel!
    
    //透過第一頁的 @IBSegueAction func內傳資料給var birthday: Date!
    var birthday: Date!
    //建立生命靈數的數字array
    let lifecodeNumber = ["0","1","2","3","4","5","6","7","8","9"]
    
    //建立一個function 裡面會有一個參數(date)傳入，型別為Date
    //function傳輸來的型別會是Int型別
    func calculateLifeNumber(date: Date) -> Int {
        // DateFormatter()功能指派給dateFormatter
        let dateFormatter = DateFormatter()
        // dateFormatter格式為年月日連續字串
        dateFormatter.dateFormat = "yMd"
        //將第一頁的選擇後的日期，帶入後指派給numberString
        var numberString = dateFormatter.string(from: date)
        //指派一個變數0給sum
        var sum = 0
        
        repeat {
            sum = 0
            //透過迴圈將字串轉型為int後相加
            for character in numberString {
                let number = Int(String(character))!
                sum = sum + number
            }
            //並將加總後的數字轉型回字串
            numberString = "\(sum)"
            //當sum超過9時繼續執行
        } while sum > 9
        return sum
    }

    //建立一個func執行網頁畫面顯示及第二頁右上角label的生命靈數顯示
    func updateUI() {
            //執行calculateLifeNumber的function功能
            //得到的數字指派給number
           let number = calculateLifeNumber(date: birthday)
           //右上角的數字為剛剛跑calculateLifeNumber的function的值
           lifecodeLabel.text = lifecodeNumber[number]
            //有值的話顯示網頁
           if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).htm") {

               let request = URLRequest(url: url)
               lifecodeWebView.load(request)

           }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //執行update的function
        updateUI()
    }
    

}
