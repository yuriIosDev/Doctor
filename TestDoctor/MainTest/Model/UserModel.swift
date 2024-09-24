//
//  UserModel.swift
//  DoctorTest
//
//  Created by Юрий Кузнецов on 03.09.2024.
//

import Foundation
 
struct UserModel: Decodable{
    let record: UserModelRecods
}

struct UserModelRecods: Decodable{
    let data: UserModelRecodsData
}

struct UserModelRecodsData: Decodable{
    let users: [CurentUser]
}

struct CurentUser: Decodable{
    let id: String
    let avatar: String?
    let first_name: String?
    let last_name: String?
    let patronymic: String?
    let specialization: [CurentUserSpec]?
    let ratings_rating: Float?
    let education_type_label: CurentUserEd?
    let is_favorite: Bool
    let free_reception_time: [CurentUserFreeTime]
    let text_chat_price: Int?
    let video_chat_price: Int?
    let hospital_price: Int?
    let work_expirience: [CurentUserExperience]
    let scientific_degree_label: String?
    let organization: String?
    
    var totalExperience: Int {
        work_expirience.reduce(0) { sum, experience in
            let end_date = experience.end_date ?? Int(Date().timeIntervalSince1970)
            let start_date = experience.start_date ?? 0
            return sum + (end_date - start_date) / (365 * 24 * 60 * 60)
        }
    }
    var formattedExperience: String {
            "\(totalExperience) \(yearsSuffix(for: totalExperience))"
        }
        
        private func yearsSuffix(for years: Int) -> String {
            let lastDigit = years % 10
            let lastTwoDigits = years % 100
            
            if lastTwoDigits >= 11 && lastTwoDigits <= 14 {
                return "лет"
            }
            
            switch lastDigit {
            case 1:
                return "год"
            case 2, 3, 4:
                return "года"
            default:
                return "лет"
            }
        }
}



struct CurentUserSpec: Decodable{
    let name: String?
}

struct CurentUserEd: Decodable{
    let name: String?
}

struct CurentUserFreeTime: Decodable{
    let time: Int
}

struct CurentUserExperience: Decodable {
    let start_date: Int?
    let end_date: Int?
}

