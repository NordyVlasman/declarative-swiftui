import Foundation
import SwiftUI

protocol UIDelegate {}

@available(OSX 10.15, *)
protocol UIComponent {
    var uniqueID: UUID { get }
    func render(uiDelegate: UIDelegate) -> AnyView
}

@available(OSX 10.15, *)
func renderPage(ui: [UIComponent], uiDelegate: UIDelegate) -> AnyView {
    return
        VStack {
            ForEach(ui, id: \.uniqueID) { uiComponent in
                uiComponent.render(uiDelegate: uiDelegate)
            }
        }.anyView()
}

public class DeclarativeUI {
    var url: URL
    
    private var screens = [String: Screen]()
    
    init(url: URL) {
        self.url = url
    }
    
    func fetch(completion: (Screen) -> Void) {
        print(url)
        let url = self.url
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        print(data)
        let app = try! decoder.decode(Application.self, from: data)
        
        for screen in app.screens {
            screens[screen.id] = screen
        }
        completion(app.screens[0])
    }
}
