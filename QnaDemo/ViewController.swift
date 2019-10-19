//
//  ViewController.swift
//  QnaDemo
//
//  Created by Stanley Tseng on 2019/10/18.
//  Copyright © 2019 StanleyAppWorld. All rights reserved.
//
//  小提醒：
//  產生亂數後的陣列上不知如何直接與nextQuestion Buttot做連動（測試時一直無法正常執行）
//  所以改採用清空原始陣列內容，改存入新的亂碼陣列，以便完成預計功能。（此部分尚有很大的修正空間）
//  裡面有很多在調整index和count，為了可以持續操作App，並確保第幾題與陣列顯示的問答順序都正常。
//  由於尚在學習中，所以Main.storyboard設定還不太熟悉，有非常多設定值都不太正確唷！
//  目前只有在iPhone 11 畫面顯示正常（直式）。其他都還不太正常⋯未來會持續需修正與調整！＾^"
//

import UIKit

class ViewController: UIViewController {
    
    struct Qna {
        var question = ""
        var answer = ""
    }
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var countImage: UIImageView!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerImage: UIImageView!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var index = 0
    var count = 0
    var qnaArray = [Qna(question: "星際大戰(Star Wars)導演？", answer: "喬治·盧卡斯"),
                    Qna(question: "黑武士(達斯·維達)其實就是？", answer: "安納金·天行者"),
                    Qna(question: "複製人軍隊原始基因是誰的？", answer: "賞金獵人 強格‧費特"),
                    Qna(question: "路克天行者和莉亞公主的關係？", answer: "兄妹"),
                    Qna(question: "最強的絕地武士？", answer: "尤達大師"),
                    Qna(question: "千年鷹號艦長？", answer: "韓·索羅"),
                    Qna(question: "第一部星戰電影哪一年上映？", answer: "1977"),
                    Qna(question: "如何判斷你的原力很強？", answer: "爆表的迷地原蟲"),
                    Qna(question: "銀河帝國製造的最強武器？", answer: "死星"),
                    Qna(question: "星戰經典台詞？", answer: "May the Force be with you"),
                    Qna(question: "韓索羅的好朋友？", answer: "丘巴卡"),
                    Qna(question: "莉亞公主與韓·索羅的兒子？", answer: "凱羅·忍"),
                    Qna(question: "歐比王·肯諾比的師父？", answer: "魁剛·金"),
                    Qna(question: "最帥氣的武器？", answer: "帥到翻掉的光劍"),
                    Qna(question: "第八集出現的可愛生物？", answer: "波波其實是海鳥"),
                    Qna(question: "C-3PO會多少語言？", answer: "六百萬種"),
                    Qna(question: "第一集到第九集總共拍幾年？", answer: "42年"),
                    Qna(question: "可以滾來滾去的機器人？", answer: "就我啊！BB-8"),
                    Qna(question: "星際大戰主題樂園在哪？", answer: "美國加州和佛州"),
                    Qna(question: "誰曾經是絕地也是西斯？", answer: "杜庫伯爵"),
                    Qna(question: "經典反派小小兵？", answer: "帝國風暴兵(白兵)"),
                    Qna(question: "韓·索羅是誰演的？", answer: "哈里遜·福特"),
                    Qna(question: "路克·天行者是誰演的？", answer: "馬克·漢米爾"),
                    Qna(question: "莉亞公主是誰演的？", answer: "嘉莉·費雪"),
                    Qna(question: "雲杜大師是誰演的？", answer: "山繆·傑克森"),
                    Qna(question: "帕米·艾米達拉是誰演的？", answer: "娜塔莉·波曼"),
                    Qna(question: "魁剛·金是誰演的？", answer: "地表最強老爸～連恩·尼遜"),
                    Qna(question: "歐比王·肯諾比是誰演的？", answer: "伊旺·麥奎格"),
                    Qna(question: "R2-D2是誰演的？", answer: "肯尼·貝克"),
                    Qna(question: "安納金對路克說了什麼？", answer: "I am your father."),
                    Qna(question: "C-3PO最常說的一句話？", answer: "我們死定了！"),
                    Qna(question: "歐比王痛心對安納金說？", answer: "You were the chosen one."),
                    Qna(question: "星戰主題曲誰創作的？", answer: "約翰·威廉斯"),
                    Qna(question: "尤達大師身高？", answer: "聽說大師身高66公分，體重13公斤"),
                    Qna(question: "星戰拍片的順序？", answer: "456拍完後拍123，最後789")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        answerLabel.isHidden = true
        
        count += 1
        countLabel.text = "第\(count)題"
        
        if count == 11 {
            count = 0
            index = 0
            print(index)  // 檢測排序用
            nextQuestion()
            index -= 1
        }
        
        questionLabel.text = qnaArray[index+1].question
        answerLabel.text = qnaArray[index+1].answer
        
        if index < 10 {
            index += 1
            print(index) // 測檢測排序用
        }
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.isHidden = false
    }
    
    func nextQuestion(){

        let newqnaArray = qnaArray.shuffled() // 產生隨機亂數
        index = 0
        questionLabel.text = newqnaArray[index].question
        answerLabel.text = newqnaArray[index].answer
        
        qnaArray = []          // 清空原始陣列（之後給nextQuestion button使用）
        qnaArray = newqnaArray // 將亂數排列的陣列回存至原始陣列
        print(qnaArray) // 檢測陣列內容是否隨機排列
        
        count = 1
        countLabel.text = "第\(count)題"
        answerLabel.isHidden = true
    }
}

