//
//  MovieInfo.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0051 on 12/28/23.
//

import Foundation
import UIKit

struct MovieInfo {
    var title: String
    var time01: String
    var time02: String
    var time03: String
    var people: Int
    var price: Int
    var movieImage: String
    var selectedTime: String? 
}

let movie: [MovieInfo] = [
    MovieInfo(title: "서울의 봄", time01: "10:00", time02: "12:00", time03: "14:00", people: 0, price: 7000, movieImage: "movie01"),
    MovieInfo(title: "노량", time01: "10:30", time02: "12:30", time03: "14:30", people: 0, price: 7000, movieImage: "movie02"),
    MovieInfo(title: "짱구는 못말려 극장판", time01: "11:00", time02: "13:00", time03: "15:00", people: 0, price: 7000, movieImage: "movie03"),
    
]
