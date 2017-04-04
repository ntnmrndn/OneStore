//
//  NonOptionalOneStore.swift
//  OneStore
//
//  Created by muukii on 2/28/17.
//  Copyright © 2017 muukii. All rights reserved.
//

import Foundation

open class NonOptionalOneStore<T: OneStoreValueProtocol>: OneStoreType {

  public typealias Value = T

  public let source: OneStore<T>
  private let initialValue: T

  public final var storeKey: String {
    return source.storeKey
  }

  public final var stack: Stack {
    return source.stack
  }

  public final var rawStoreKey: String {
    return source.rawStoreKey
  }

  public init(stack: Stack, key: String, initialValue: T) {
    self.source = OneStore<T>(stack: stack, key: key, initialValue: initialValue)
    self.initialValue = initialValue
  }

  public convenience init<R: RawRepresentable>(stack: Stack, key: R, initialValue: T) where R.RawValue == String {
    self.init(stack: stack, key: key.rawValue, initialValue: initialValue)
  }

  open var value: T {
    get {
      guard let value = source.value else {
        assertionFailure("This feature has broken😭")
        return initialValue
      }
      return value
    }
    set {
      source.value = newValue
    }
  }
}
