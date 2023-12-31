import UIKit

class TicketViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var ticketTableView: UITableView!
    
    var cart = [MovieInfo]()
    var selectedTimeButton: UIButton?
    var timeButtons: [UIButton] = []

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // 장바구니 초기화
        cart.removeAll()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "영화 내역"
        ticketTableView.dataSource = self
    }
    
    @IBAction func timeButtonTapped(_ sender: UIButton) {
        
        // 이전에 선택된 버튼을 초기 상태로 되돌립니다.
        if let selectedButton = selectedTimeButton {
            UIView.animate(withDuration: 0.3) {
                selectedButton.backgroundColor = .lightGray
                selectedButton.setTitleColor(.black, for: .normal)
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
    
    @IBAction func cartButtonTapped(_ sender: UIButton) {
        for movie in cart {
            print("장바구니에 담긴 영화 제목: \(movie.title)")
            print("장바구니에 담긴 영화 선택된 시간: \(String(describing: movie.selectedTime))")
            print("장바구니에 담긴 영화 가격: \(movie.price)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCart", let destinationVC = segue.destination as? ShoppingCartController {
            destinationVC.cartItems = self.cart
        }
    }
    
    // UITableViewDataSource 메서드 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let currentMovie = movie[indexPath.row]
        cell.iconImageView.image = UIImage(named: currentMovie.movieImage)
        cell.title.text = currentMovie.title
        cell.timeButton01.setTitle(currentMovie.time01, for: .normal)
        cell.timeButton02.setTitle(currentMovie.time02, for: .normal)
        cell.timeButton03.setTitle(currentMovie.time03, for: .normal)
        cell.timeButton01.tag = indexPath.row
        cell.timeButton02.tag = indexPath.row
        cell.timeButton03.tag = indexPath.row
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
}
