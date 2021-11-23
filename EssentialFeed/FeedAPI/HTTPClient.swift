import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient { //  shared state is no longer needed since we have the dependency injection
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
