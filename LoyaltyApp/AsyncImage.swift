//
//  AsyncImage.swift
//  LoyaltyApp
//
//  Created by Justin Edgington on 1/24/24.
//

import Foundation
import SwiftUI
import Combine

extension URL {
    func loadImage() -> AnyPublisher<UIImage?, Never> {
        return URLSession.shared.dataTaskPublisher(for: self)
            .map { data, _ in UIImage(data: data) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    func load(from url: URL) {
        cancellable = url.loadImage()
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    func cancel() {
        cancellable?.cancel()
    }
}

struct AsyncImage: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Image

    init(url: URL, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        loader = ImageLoader()
        loader.load(from: url)
    }

    var body: some View {
        image
            .onDisappear(perform: loader.cancel)
    }

    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
