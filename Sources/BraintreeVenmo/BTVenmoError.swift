import Foundation

/// Error codes associated with Venmo App Switch
enum BTVenmoAppSwitchError: Error, CustomNSError, LocalizedError {

    /// 0. The error returned from the Venmo return URL
    case returnURLError(Int, String?)

    static var errorDomain: String {
        "com.braintreepayments.BTVenmoAppSwitchReturnURLErrorDomain"
    }

    var errorCode: Int {
        switch self {
        case .returnURLError(let errorCode, _):
            return errorCode
        }
    }

    var errorDescription: String? {
        switch self {
        case .returnURLError(_, let errorMessage):
            return errorMessage
        }
    }
}

/// Error codes associated with Venmo
enum BTVenmoError: Error, CustomNSError, LocalizedError {

    /// 0. Unknown error
    case unknown

    /// 1. Venmo is not enabled
    case disabled

    /// 2. The Venmo app is not installed or configured for app Switch
    case appNotAvailable

    /// 3. Bundle display name is nil
    case bundleDisplayNameMissing

    /// 4. App Switch could not complete
    case appSwitchFailed

    /// 5. Return URL is invalid
    case invalidReturnURL(String)

    /// 6. No body was returned from the request
    case invalidBodyReturned

    /// 7. Invalid request URL
    case invalidRedirectURL(String)

    /// 8. Failed to fetch Braintree configuration
    case fetchConfigurationFailed

    static var errorDomain: String {
        "com.braintreepayments.BTVenmoErrorDomain"
    }

    var errorCode: Int {
        switch self {
        case .unknown:
            return 0
        case .disabled:
            return 1
        case .appNotAvailable:
            return 2
        case .bundleDisplayNameMissing:
            return 3
        case .appSwitchFailed:
            return 4
        case .invalidReturnURL:
            return 5
        case .invalidBodyReturned:
            return 6
        case .invalidRedirectURL:
            return 7
        case .fetchConfigurationFailed:
            return 8
        }
    }

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "An unknown error occurred. Please contact support."
        case .disabled:
            return "Venmo is not enabled for this merchant account."
        case .appNotAvailable:
            return "The Venmo app is not installed on this device, or it is not configured or available for app switch."
        case .bundleDisplayNameMissing:
            return "CFBundleDisplayName must be non-nil. Please set 'Bundle display name' in your Info.plist."
        case .appSwitchFailed:
            return "UIApplication failed to perform app switch to Venmo."
        case .invalidReturnURL(let missingValue):
            return "Return URL is missing \(missingValue)"
        case .invalidBodyReturned:
            return "The request returned a body that was missing or nil."
        case .invalidRedirectURL(let description):
            return description
        case .fetchConfigurationFailed:
            return "Failed to fetch Braintree configuration."
        }
    }
}
