//
//  LoadDataFromJson.swift
//  useeds-app
//
//  Created by Dicky Buwono on 06/12/21.
//

import Foundation

class JsonHelper: ObservableObject {
    @Published var plants = [Plant]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        let filePath = Bundle.main.path(forResource: "plantdata", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([Plant].self, from: data)
                    
                    DispatchQueue.main.sync {
                        self.plants = json
                    }
                    
                } else {
                    print("No Data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
