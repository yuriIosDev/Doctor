//
//  SwiftUIView.swift
//  DoctorTest
//
//  Created by Юрий Кузнецов on 22.08.2024.
//

import SwiftUI

struct CardViewBoss: View {
    var item: CurentUser
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                HStack (alignment: .center,spacing: 16) {
                    if let avatar = item.avatar, let url = URL(string: avatar) {
                            AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                    } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                        }
                    VStack (alignment: .leading, spacing: 7) {
                        Text (item.last_name ?? "")
                        HStack {
                            Text (item.first_name ?? "")
                            Text (item.patronymic ?? "")
                        }
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .foregroundColor(.textBlack)
                }
                VStack (alignment: .leading, spacing: 10) {
                    HStack (spacing: 12) {
                        textImg(image: "wotch", text: "Опыт работы: \(item.formattedExperience)")
                        }
                    HStack (spacing: 12) {
                        textImg(image: "doctor", text: item.scientific_degree_label ?? "Не указано")
                    }
                    HStack (spacing: 12) {
                        textImg(image: "maps", text: (item.education_type_label?.name ?? "Не указан"))
                    }
                    HStack (spacing: 12) {
                        textImg(image: "map", text: item.organization ?? "Не указано")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack (spacing: 24) {
                    NavigationLink(destination: PriceView(item: item)) {
                        HStack {
                            Text ("Стоимость услуг")
                            Spacer()
                            Text ("от \(item.hospital_price ?? 0) руб")
                        }
                        }
                        .padding()
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .foregroundColor(.textBlack)
                    VStack {
                        Text ("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.textGray)
                    }
                    Spacer()
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Записаться")
                                .foregroundStyle(.white)
                        })
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.btnBG)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            
        }
        .padding(.top, 20)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .background(.bgFon)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle((item.specialization?.first?.name ?? "Врач"))
    }
}
    

//#Preview {
//    SwiftUIView()
//}

struct textImg: View {
    var image: String
    var text: String
    var body: some View {
        Image (image)
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(.textGray)
        Text(text)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.textGray)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
