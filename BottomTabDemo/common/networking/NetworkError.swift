//
//  NetworkError.swift
//  BottomTabDemo
//
//  Created by Md Altaf Hoshain Firoj on 1/9/24.
//
import Foundation

class NetworkError {
    static func customErrorMessage(from error: Error) -> String {
        let nsError = error as NSError
        switch nsError.code {
        case URLError.notConnectedToInternet.rawValue:
            return "No internet connection."
        case URLError.timedOut.rawValue:
            return "Request timed out."
        case URLError.fileDoesNotExist.rawValue:
            return "File not found."
        case URLError.badServerResponse.rawValue:
            return "Server responded with an error."
        default:
            return "An unexpected error occurred: \(error.localizedDescription)"
        }
    }
}

