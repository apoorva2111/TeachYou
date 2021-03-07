//


enum HTTPStatusCode: Int {
    
    case ok = 200
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case requestTimeout = 408
    case internalServerError = 500
    case unknown
}
