import Foundation
import UIKit


class MarketCartController: UIViewController {
    
    @IBOutlet weak var marketInfoTableView: UITableView!
    
    @IBOutlet weak var selectedMarketCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedMarketCollection.backgroundColor = .green
    }
}


extension MarketCartController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
