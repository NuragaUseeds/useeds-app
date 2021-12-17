//
//  PlantDetailView.swift
//  useeds-app
//
//  Created by Dicky Buwono on 07/12/21.
//

import SwiftUI

struct PlantDetailView: View {
    let plant: Plant
    @State var nowDate: Date = Date()
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.nowDate = Date()
        }
    }
    @State private var selectedIndex = 0
    var body: some View {
        ZStack(alignment: .top) {
            Image("Bg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                .edgesIgnoringSafeArea(.top)
            ScrollView {
                Picker("Try", selection: $selectedIndex) {
                    Text("Overview").tag(0)
                    Text("History").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                if selectedIndex == 0 {
                    Image("Hands")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/3.5, alignment: .center)
                        .scaledToFill()
                    VStack(alignment: .leading, spacing: 10) {
                        Text(plant.name)
                            .foregroundColor(Color("BlueButton"))
                            .font(.system(size: 40, weight: .bold))
                        Text("(Nama Latin)")
                            .font(.system(size: 16))
                            .italic()
                        Text(plant.description)
                            .font(.system(size: 12, weight: .bold))
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.vertical, 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blue)
                                    .frame(width: UIScreen.main.bounds.width/1.2)
                            )
                            .frame(width: UIScreen.main.bounds.width/1.2)
                        Text("Estimasi panen : \(plant.mission.count) day")
                            .font(.system(size: 12, weight: .bold))
                            .padding(.vertical)
                    }
                    missionButton()
                    Spacer()
                   
                }else {
                    MissionList(plant: plant)
                }
            }
            .padding(.horizontal)
        }.onAppear {
            _ = self.timer
        }
    }
    
    @ViewBuilder
    private func missionButton() -> some View {
        ForEach(plant.mission, id: \.id) { item in
            let component = DateComponents(timeZone: TimeZone(identifier: TimeZone.current.identifier), year: Calendar.current.component(.year, from: Date()), month: Calendar.current.component(.month, from: Date()), day: 13, hour: 15)
            let createAt = Calendar.current.date(from: component)
            let dateNya = DateComponents(year: Calendar.current.component(.year, from: createAt!), month: Calendar.current.component(.month, from: createAt!), day: Calendar.current.component(.day, from: createAt!) + item.id)
            let dateAsli = Calendar.current.date(from: dateNya)
            if Calendar.current.component(.day, from: dateAsli ?? Date()) == Calendar.current.component(.day, from: Date()) {
                VStack {
                    if item.airStatus == .need {
                        let compt = DateComponents(timeZone: TimeZone(identifier: TimeZone.current.identifier), year: Calendar.current.component(.year, from: Date()), month: Calendar.current.component(.month, from: Date()), day: Calendar.current.component(.day, from: Date()), hour: Int(item.time))
                        let referenceDate = Calendar.current.date(from: compt) ?? Date()
                        Button {
                            
                        }label: {
                            Text(Int(item.time) ?? 0>Calendar.current.component(.hour, from: Date()) ? "Next Watering \(countDownString(from: referenceDate))" : "Jadwal pengecekan sudah terlewat")
                                .font(.system(size: 16, weight: .bold))
                                .italic()
                                .padding()
                        }
                        .frame(width: UIScreen.main.bounds.width/1.2)
                        .disabled(Int(item.time) ?? 0<Calendar.current.component(.hour, from: Date()))
                        .background(Int(item.time) ?? 0>Calendar.current.component(.hour, from: Date()) ? Color("BlueButton") : Color(.systemGray4))
                        .cornerRadius(10)
                        .padding()
                    } else {
                        Text("Tanaman telah di cek hari ini")
                            .frame(width: UIScreen.main.bounds.width/1.2)
                            .background(Color("BlueButton"))
                            .cornerRadius(10)
                            .padding()
                    }
                    
                    if item.nutrisiStatus == .need {
                        let compt = DateComponents(timeZone: TimeZone(identifier: TimeZone.current.identifier), year: Calendar.current.component(.year, from: Date()), month: Calendar.current.component(.month, from: Date()), day: Calendar.current.component(.day, from: Date()), hour: Int(item.time))
                        let referenceDate = Calendar.current.date(from: compt) ?? Date()
                        Button {
                            
                        }label: {
                            Text(Int(item.time) ?? 0>Calendar.current.component(.hour, from: Date()) ? "Next Nutrition \(countDownString(from: referenceDate))" : "Jadwal pengecekan sudah terlewat")
                                .font(.system(size: 16, weight: .bold))
                                .italic()
                                .padding()
                        }
                        .frame(width: UIScreen.main.bounds.width/1.2)
                        .disabled(Int(item.time) ?? 0<Calendar.current.component(.hour, from: Date()))
                        .background(Int(item.time) ?? 0>Calendar.current.component(.hour, from: Date()) ? Color("BlueButton") : Color(.systemGray4))
                        .cornerRadius(10)
                        .padding()
                    } else {
                        Text("Tanaman telah di cek hari ini")
                            .frame(width: UIScreen.main.bounds.width/1.2)
                            .background(Color("BlueButton"))
                            .cornerRadius(10)
                            .padding()
                    }
                }
                
            }
        }
        
    }
    
    private func countDownString(from date: Date) -> String {
           let calendar = Calendar(identifier: .gregorian)
           let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                               from: nowDate,
                               to: date)
           return String(format: "%02dd:%02dh:%02dm:%02ds",
                         components.day ?? 00,
                         components.hour ?? 00,
                         components.minute ?? 00,
                         components.second ?? 00)
       }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: (Customer.preview.plants?[2])!)
    }
}
