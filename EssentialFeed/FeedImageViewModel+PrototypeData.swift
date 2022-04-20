import Foundation

extension FeedImageUIViewModel {
    static var prototypeFeed: [FeedImageUIViewModel] {
        return [
            FeedImageUIViewModel(
                description: "The East Side Gallery is an open-air gallery in Berlin. It consists of a series of murals painted directly on a 1,316 m long remnant of the Berlin Wall, located near the centre of Berlin, on Mühlenstraße in Friedrichshain-Kreuzberg. The gallery has official status as a Denkmal, or heritage-protected landmark.",
                location: "East Side Gallery\nMemorial in Berlin, Germany",
                imageName: "image-0"
            ),
            FeedImageUIViewModel(
                description: nil,
                location: "Cannon Street, London",
                imageName: "image-1"
            ),
            FeedImageUIViewModel(
                description: "The Desert Island in Faro is beautiful!! ☀️",
                location: nil,
                imageName: "image-2"
            ),
            FeedImageUIViewModel(
                description: nil,
                location: nil,
                imageName: "image-3"
            ),
            FeedImageUIViewModel(
                description: "Garth Pier is a Grade II listed structure in Bangor, Gwynedd, North Wales. At 1,500 feet in length, it is the second-longest pier in Wales, and the ninth longest in the British Isles.",
                location: "Garth Pier\nNorth Wales",
                imageName: "image-4"
            ),
            FeedImageUIViewModel(
                description: "Glorious day in Brighton!! 🎢",
                location: "Brighton Seafront",
                imageName: "image-5"
            )
        ]
    }
}
