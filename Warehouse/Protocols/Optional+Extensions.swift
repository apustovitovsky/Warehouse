import Foundation
import Combine


public protocol OptionalProtocol {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalProtocol {
    public var value: Wrapped? {
        return self
    }
}

extension Publishers {
    
    struct Unwrapped<Upstream> : Publisher where Upstream: Publisher, Upstream.Output: OptionalProtocol {
        
        typealias Output = Upstream.Output.Wrapped
        typealias Failure = Upstream.Failure

        public let upstream: AnyPublisher<Upstream.Output.Wrapped, Upstream.Failure>

        public init(upstream: Upstream) {
            self.upstream = upstream
                .flatMap { optional -> AnyPublisher<Output, Failure> in
                    guard let unwrapped = optional.value else {
                        return Empty().eraseToAnyPublisher()
                    }
                    return Result.Publisher(unwrapped).eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
        }

        public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            upstream.receive(subscriber: subscriber)
        }
    }
}

extension Publisher where Output: OptionalProtocol {
    func unwrap() -> Publishers.Unwrapped<Self> {
        return Publishers.Unwrapped(upstream: self)
    }
}
