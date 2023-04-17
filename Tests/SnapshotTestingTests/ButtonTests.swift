//
//  ButtonTests.swift
//
//
//  Created by Laurens Coderre on 2023-03-13.
//

import UIKit
import XCTest
@testable import SnapshotTesting

@available(iOS 15.0, *)
class ButtonTests: XCTestCase {
  func testCapsuleButton() {
    assertSnapshot(
      matching: UIButton(configuration: .buggyCapsule),
      as: Snapshotting<UIView, UIImage>.image,
      record: true
    )
  }
}

@available(iOS 15.0, *)
extension UIButton.Configuration {
  static let buggyCapsule: Self = .bordered().then {
    $0.baseBackgroundColor = .clear
    $0.baseForegroundColor = .systemBlue
    $0.background.strokeColor = .systemBlue
    $0.background.strokeWidth = 2
    $0.cornerStyle = .capsule
    $0.title = "Test button"
  }

  func then(_ map: (inout Self) -> Void) -> Self {
    var copy = self
    map(&copy)
    return copy
  }
}
