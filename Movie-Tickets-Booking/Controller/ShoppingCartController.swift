import Foundation
import UIKit

class ShoppingCartController: UIViewController {

    @IBOutlet weak var selectMovieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieTimeLabel: UILabel!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    @IBOutlet weak var moviePriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    //var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        selectMovieImageView.image = movie.image
        movieTitleLabel.text = "\(movie.name)"
        movieTimeLabel.text = "시간: \(movie.time)"
        numOfPeopleLabel.text = "인원수: \(movie.people)명"
        moviePriceLabel.text = "가격: \(movie.price),000원"
        */
        
        selectMovieImageView.image = UIImage.movie01
        movieTitleLabel.text = "서울의 봄"
    }
    
    @IBAction func paymentTapButton(_ sender: Any) {
        showPaymentAlert()
    }
    
    func showPaymentAlert() {
        let alertController = UIAlertController(title: "결제하기", message: "정말로 결제를 진행하시겠습니까?", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "확인", style: .default) { (_) in
            //메인화면으로 이동
            
            //영수증 표시
            //self.showReceipt()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showReceipt() {
        //콘솔에 영수증 출력
        /*
        print("영화 제목: \(selectedMovie)")
        print("영화 시간: \(selectedTime)")
        print("관람 인원: \(selectedNumberOfPeople)명")
        print("결제 금액: \(selectedPrice)원")*/
    }
}
