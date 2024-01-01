import UIKit
import YouTubeiOSPlayerHelper

class TicketViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var ticketTableView: UITableView!
    
    var movies: [MovieInfo] = movie
    var cart = [MovieInfo]()
    var selectedTimeButton: UIButton?
    var timeButtons: [UIButton] = []
    var loadingIndicator: UIActivityIndicatorView?


    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // 장바구니 초기화
        cart.removeAll()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketTableView.dataSource = self
    }
    
    @IBAction func timeButtonTapped(_ sender: UIButton) {
        
        // 이전에 선택된 버튼을 초기 상태로 되돌립니다.
        if let selectedButton = selectedTimeButton {
            UIView.animate(withDuration: 0.3) {
                selectedButton.backgroundColor = .lightGray
            }
        }
        
        // 새로 선택된 버튼의 색상을 애니메이션과 함께 변경합니다.
        UIView.animate(withDuration: 0.3) {
            sender.backgroundColor = .systemBlue
            sender.setTitleColor(.white, for: .normal)
        }


            // 현재 버튼을 선택된 버튼으로 설정합니다.
        selectedTimeButton = sender

        let tag = sender.tag
        
        // 선택된 버튼의 시간 처리 로직
        guard let selectedTime = sender.currentTitle else {
            print("No time selected.")
            return
        }
        var movieToUpdate = movie[tag]
        movieToUpdate.selectedTime = selectedTime
        if let index = cart.firstIndex(where: { $0.title == movieToUpdate.title }) {
            cart[index].selectedTime = selectedTime
        } else {
            cart.append(movieToUpdate)
        }
        print("장바구니에 담긴 영화: \(movieToUpdate.title), 선택된 시간: \(selectedTime)")
    }
    
    @IBAction func trailerButtonTapped(_ sender: UIButton) {
        guard let indexPath = self.ticketTableView.indexPathForView(sender) else {
            return
        }
        showTrailer(at: indexPath)
    }

    @IBAction func cartButtonTapped(_ sender: UIButton) {
        for movie in cart {
            print("장바구니에 담긴 영화 제목: \(movie.title)")
            print("장바구니에 담긴 영화 선택된 시간: \(String(describing: movie.selectedTime))")
            print("장바구니에 담긴 영화 가격: \(movie.price)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTrailer",
           let destinationVC = segue.destination as? YoutubePlayerViewController,
           let movieInfo = sender as? MovieInfo {
            destinationVC.videoID = movieInfo.trailerURL?.absoluteString
            destinationVC.introductionText = movieInfo.introduction
        }
        
        if segue.identifier == "showCart",
              let destinationVC = segue.destination as? ShoppingCartController {
               destinationVC.cartItems = self.cart
           }
    }

    // UITableViewDataSource 메서드 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let currentMovie = movie[indexPath.row]
        
        cell.timeButton01.tag = indexPath.row
        cell.timeButton02.tag = indexPath.row
        cell.timeButton03.tag = indexPath.row
        
        cell.title.text = currentMovie.title
        cell.iconImageView.image = UIImage(named: currentMovie.movieImage)
        cell.timeButton01.setTitle(currentMovie.time01, for: .normal)
        cell.timeButton02.setTitle(currentMovie.time02, for: .normal)
        cell.timeButton03.setTitle(currentMovie.time03, for: .normal)

        cell.timeButton01.addTarget(self, action: #selector(timeButtonTapped(_:)), for: .touchUpInside)
        cell.timeButton02.addTarget(self, action: #selector(timeButtonTapped(_:)), for: .touchUpInside)
        cell.timeButton03.addTarget(self, action: #selector(timeButtonTapped(_:)), for: .touchUpInside)
        cell.indentationWidth = 150
        
        timeButtons.append(contentsOf: [cell.timeButton01, cell.timeButton02, cell.timeButton03])

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func showTrailer(at indexPath: IndexPath) {
        // 로딩 인디케이터를 화면에 표시합니다.
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator?.center = self.view.center
        self.view.addSubview(loadingIndicator!)
        loadingIndicator?.startAnimating()
        
        // 예고편 화면으로 전환합니다.
        let movieInfo = self.movies[indexPath.row]
        performSegue(withIdentifier: "showTrailer", sender: movieInfo)
    }
}

// 버튼의 테이블 뷰 내 IndexPath를 찾기 위한 도우미 확장 기능
extension UITableView {
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let point = view.convert(CGPoint.zero, to: self)
        return self.indexPathForRow(at: point)
    }
}
