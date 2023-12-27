//
//  ViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0031 on 12/26/23.
// test

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var buyTicketButton: UIButton!
    @IBOutlet weak var buyFoodButton: UIButton!
    @IBOutlet weak var confirmTicket: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDateLabel()
        updateDateTime()
        
    }
    
    // MARK: - func
    
    @IBAction func buyTicketTapped(_ sender: UIButton) {
        // 티켓 구매 화면으로 전환하는 코드
    }
    
    @IBAction func buyFoodTapped(_ sender: UIButton) {
        // 매점 구매 화면으로 전환하는 코드
    }
    
    @IBAction func confirmTicketTapped(_ sender: UIButton) {
        // 예매 확인 화면으로 전환하는 코드
    }
    
    func setupDateLabel(){
        dateLable.adjustsFontSizeToFitWidth = true
        dateLable.minimumScaleFactor = 0.5 // 최소 50% 크기까지 폰트 크기 축소
    }
    
    func updateDateTime() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분"
        dateLable.text = formatter.string(from: Date())
        
        // 옵션: Timer를 사용하여 날짜/시간을 주기적으로 업데이트
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            self?.dateLable.text = formatter.string(from: Date())
        }
    }
}
class aaaViewController: UIViewController {
}

class bbbMarkectViewController: UIViewController {
}

class ShoppingCartController: UIViewController {
    
    
   
    
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
    }
}

class dddViewController: UIViewController {
    
}

class TicketViewController: UIViewController
{
    
    // MARK: - Ticket View Life Cycle
    
    @IBOutlet weak var movieView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
