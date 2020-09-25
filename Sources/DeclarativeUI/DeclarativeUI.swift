import Foundation
import SwiftUI
//
//protocol UIDelegate {}
//
//@available(OSX 10.15, *)
//protocol UIComponent {
//    var uniqueID: UUID { get }
//    func render(uiDelegate: UIDelegate) -> AnyView
//}
//
//@available(OSX 10.15, *)
//func renderPage(ui: [UIComponent], uiDelegate: UIDelegate) -> AnyView {
//    return
//        VStack {
//            ForEach(ui, id: \.uniqueID) { uiComponent in
//                uiComponent.render(uiDelegate: uiDelegate)
//            }
//        }.anyView()
//}
//
//final public class DeclarativeUI {
//    public var url: URL
//
//    private var screens = [String: Screen]()
//
//    public init(url: URL) {
//        self.url = url
//    }
//
//    func fetch(completion: (Screen) -> Void) {
//        print(url)
//        let url = self.url
//        let data = try! Data(contentsOf: url)
//        let decoder = JSONDecoder()
//        print(data)
//        let app = try! decoder.decode(Application.self, from: data)
//
//        for screen in app.screens {
//            screens[screen.id] = screen
//        }
//        completion(app.screens[0])
//    }
//}
public protocol UIDelegate {}

public protocol UIComponent {
    var uniqueID: UUID { get }
    func render(uiDelegate: UIDelegate) -> AnyView
}

public func renderPage(ui: [UIComponent], uiDelegate: UIDelegate) -> AnyView {
    return
        VStack {
            ForEach(ui, id: \.uniqueID) { uiComponent in
                uiComponent.render(uiDelegate: uiDelegate)
            }
        }.anyView()
}

public class DeclarativeUI {
    
    @Published public var uiComponents: [UIComponent] = []
    
    private var screens = [String: Screen]()
    
    public typealias VoidBlock = () -> Void
    
    public var dataURL: URL
    
    public init(dataURL: URL) {
        self.dataURL = dataURL
    }
    
    public func fetchData(loadedHandler: ((Screen) -> Void)? = nil) {
        let data = try! Data(contentsOf: self.dataURL)
        let decoder = JSONDecoder()
        
        let app = try! decoder.decode(Application.self, from: data)
        
        for screen in app.screens {
            screens[screen.id] = screen
        }
        
        loadedHandler?(app.screens[0])
    }
    
    public func loadScreen(screen: Screen) {
        if screen.type == "navigationview" {
            uiComponents.append(NavigationComponent(title: screen.title, rows: screen.rows))
        }
    }
}
