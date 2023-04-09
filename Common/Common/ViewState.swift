//
//  ViewState.swift
//  Common
//
//  Created by Julsapargi Nursam on 09/04/23.
//

import Foundation

public enum ViewState<T> {
  case initiate
  case loading
  case empty
  case error(error: Error)
  case success(data: T)

  public var value: T? {
    get {
      if case .success(let data) = self {
        return data
      }
      return nil
    }

    set {
      if newValue is Bool {
        self = .success(data: newValue!)
      }
    }
  }

  public var isLoading: Bool {
    get {
      if case .loading = self {
        return true
      }
      return false
    }
    set {
      if newValue {
        self = .loading
      }
    }
  }

  public var error: Error {
    get {
      if case .error(let error) = self {
        return error
      }
      return NSError()
    }

    set {
      self = .error(error: newValue)
    }
  }
}

extension ViewState: Equatable {
  public static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
    switch (lhs, rhs) {
    case (.initiate, .initiate), (.empty, .empty), (.success, .success), (.loading, .loading), (.error, .error):
      return true
    default:
      return false
    }
  }
}
