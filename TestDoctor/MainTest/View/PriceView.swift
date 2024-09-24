//
//  PriceView.swift
//  DoctorTest
//
//  Created by Юрий Кузнецов on 22.08.2024.
//

import SwiftUI

struct PriceView: View {
    var item: CurentUser
    var body: some View {
        VStack (spacing: 24) {
            VStack (alignment: .leading){
                Text ("Видеоконсультация")
                    .font(.system(size: 16, weight: .semibold))
                HStack {
                    Text ("30 мин")
                    Spacer()
                    Text ("\(item.hospital_price ?? 0) ₽")
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            VStack (alignment: .leading){
                Text ("Чат с врачом")
                    .font(.system(size: 16, weight: .semibold))
                HStack {
                    Text ("30 мин")
                    Spacer()
                    Text ("\(item.hospital_price ?? 0) ₽")
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            VStack (alignment: .leading){
                Text ("Приём в клинике")
                    .font(.system(size: 16, weight: .semibold))
                HStack {
//                    priceBlok (textOne: "В клинике", text: "600 ₽")
                                        Text ("В клинике")
                                        Spacer()
                                        Text ("\(item.hospital_price ?? 0) ₽")
                                    }
                                    .padding()
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.bgFon)
            .navigationTitle("Стоимость")
        }
    }
    
    
//    #Preview {
//        PriceView()
//    }

//struct priceBlok: View {
//    var textOne: String
//    var text: String
//    var body: some View {
//        Text(textOne)
//            .padding()
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
//        Spacer()
//        Text(text)
//            .padding()
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
//    }
//}
