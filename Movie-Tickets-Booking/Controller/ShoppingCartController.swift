import Foundation
import UIKit

class ShoppingCartController: UIViewController {
    
    // 장바구니 아이템을 저장할 변수
    var cartItems: [MovieInfo] = []

    @IBOutlet weak var selectMovieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTimeLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIWithCartItems()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCart",
           let destinationVC = segue.destination as? ShoppingCartController {
            destinationVC.cartItems = cartItems
        }
    }


    @IBAction func paymentTapButton(_ sender: Any) {
        showPaymentAlert()
    }
    
    func showPaymentAlert() {
        let alertController = UIAlertController(title: "결제하기", message: "정말로 결제를 진행하시겠습니까?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "네", style: .default) { [weak self] _ in
            // 메인 화면으로 이동
            self?.navigateToMainScreen()
        }
        let noAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
    }

    func navigateToMainScreen() {
        // 메인 화면으로 이동하는 로직
        // 예: 루트 뷰 컨트롤러로 이동
        self.navigationController?.popToRootViewController(animated: true)
        // 또는: dismiss를 사용하여 모달 뷰를 닫기
        // self.dismiss(animated: true, completion: nil)
    }

    func updateUIWithCartItems() {
        // Assuming you want to display the first cart item details
        if let firstItem = cartItems.first {
            selectMovieImageView.image = UIImage(named: firstItem.movieImage)
            movieTitleLabel.text = firstItem.title
            movieTimeLabel.text = firstItem.selectedTime ?? "시간 미정"
            moviePriceLabel.text = "\(firstItem.price)원"
            
            let totalPrice = cartItems.reduce(0) { $0 + $1.price }
            totalPriceLabel.text = "\(totalPrice)원"
        }
    }
    
    // showReceipt 메서드 수정
    func showReceipt() {
        // 콘솔에 영수증 출력
        if let firstMovie = cartItems.first {
            print("영화 제목: \(firstMovie.title)")
            print("영화 시간: \(firstMovie.selectedTime ?? "미정")")
            print("관람 인원: \(firstMovie.people)명")
            print("결제 금액: \(firstMovie.price)원")
        }
    }
    
}

