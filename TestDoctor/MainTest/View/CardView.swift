
import SwiftUI

struct CardView: View {
    var item: CurentUser
    var body: some View {
        VStack (spacing: 15){
            VStack (spacing: 8){
                HStack (spacing: 16){
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
                    VStack (alignment: .leading, spacing: 5){
                        Text (item.last_name ?? "")
                        HStack {
                            Text (item.first_name ?? "")
                            Text (item.patronymic ?? "")
                        }
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.textBlack)
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image (systemName: item.is_favorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .accentColor(item.is_favorite ? .btnBG : .btnGrayBG)
                    })
                }
                .padding(.horizontal, 16)
                VStack (alignment: .leading, spacing: 8){
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: (item.ratings_rating != nil && Float(index) < item.ratings_rating!) ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor((item.ratings_rating != nil && Float(index) < item.ratings_rating!) ? .btnBG : .btnGrayBG)
                        }
                    }
                    HStack {
                        Text (item.specialization?.first?.name ?? "Врач")
                        Text ("Стаж: \(item.formattedExperience)")
                    }
                    HStack {
                        Text ("от \(item.hospital_price ?? 0) руб")
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading, 86)
                .foregroundStyle(.textGray)
            }
            VStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Записаться")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                })
                
                .padding(.vertical, 15)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(item.free_reception_time.count == 0 ? .gray : .btnBG)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 16)
                
                
                
            }
            
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


//#Preview {
//    CardView()
//}
