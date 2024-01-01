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
    var people: Int?
    var price: Int
    var movieImage: String
    var selectedTime: String?
    var trailerURL : URL!
    var introduction : String
}

let movie: [MovieInfo] = [
    
    MovieInfo(title: "서울의 봄",
              time01: "10:00",
              time02: "12:00",
              time03: "14:00",
              people: nil,
              price: 7000,
              movieImage: "movie01",
              trailerURL: URL(string: "-AZ7cnwn2YI"),
              introduction: "1979년 12월 12일, 수도 서울 군사반란 발생 그날, 대한민국의 운명이 바뀌었다 대한민국을 뒤흔든 10월 26일 이후, 서울에 새로운 바람이 불어온 것도 잠시 12월 12일, 보안사령관 전두광이 반란을 일으키고 군 내 사조직을 총동원하여 최전선의 전방부대까지 서울로 불러들인다. 권력에 눈이 먼 전두광의 반란군과 이에 맞선 수도경비사령관 이태신을 비롯한 진압군 사이, 일촉즉발의 9시간이 흘러가는데… 목숨을 건 두 세력의 팽팽한 대립 오늘 밤, 대한민국 수도에서 가장 치열한 전쟁이 펼쳐진다!"),
    
    MovieInfo(title: "노량",
              time01: "10:30",
              time02: "12:30",
              time03: "14:30",
              people: nil,
              price: 7000,
              movieImage:"movie02",
              trailerURL: URL(string: "gXEpZpnImY8"),
              introduction: "임진왜란 발발로부터 7년이 지난 1598년 12월. 이순신(김윤석)은 왜군의 수장이던 도요토미 히데요시가 갑작스럽게 사망한 뒤 왜군들이 조선에서 황급히 퇴각하려 한다는 것을 알게 된다. “절대 이렇게 전쟁을 끝내서는 안 된다” 왜군을 완벽하게 섬멸하는 것이 이 전쟁을 올바르게 끝나는 것이라 생각한 이순신은 명나라와 조명연합함대를 꾸려 왜군의 퇴각로를 막고 적들을 섬멸하기로 결심한다. 하지만 왜군의 뇌물 공세에 넘어간 명나라 도독 진린(정재영)은 왜군에게 퇴로를 열어주려 하고, 설상가상으로 왜군 수장인 시마즈(백윤식)의 살마군까지 왜군의 퇴각을 돕기 위해 노량으로 향하는데…"),
              
    MovieInfo(title: "짱구는 못말려 극장판",
              time01: "11:00",
              time02: "13:00",
              time03: "15:00",
              people: nil,
              price: 7000,
              movieImage: "movie03",
              trailerURL: URL(string: "0AUaTkV2-OY"),
              introduction: "최초의 3D CG! 제작 기간 7년 최고의 웃음과 감동! 최강의 스케일 옷까지 갈아입은 볼록 짱구 등장! 어느 날, 우주에서 날아온 검은 빛과 하얀 빛이 떡잎마을을 향해 떨어진다. 평소처럼 저녁밥을 손꼽아 기다리던 짱구는 하얀 빛에 정통으로 맞게 되고 그러자 온몸에 넘치는 신비한 힘! 힘에 몸을 맡긴 채 엉덩이에 의식을 집중하자 장난감들이 붕붕 떠오른다. '엉덩이... 엉덩이가 뜨거워...!? 뭔지 몰라도 엄청난 힘을 손에 넣은 것 같아.' 한편, 검은 빛을 통해 초능력을 손에 넣은 또 다른 남자는 이 세상의 파멸을 바라며 폭주하기 시작하는데, 위기에 처한 세상을 구하기 위한 유일한 희망이 바로 짱구...!?"),
]
