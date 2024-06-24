import XCTest
@testable import ListingRepo

final class ListingRepoTests: XCTestCase {
    var repo: ListingRepo!
    var service: MockListingService!
    
    override func setUp() {
        super.setUp()
        service = MockListingService()
        repo = ListingRepo(service: service)
    }
    
    override func tearDown() {
        super.tearDown()
        service = nil
        repo = nil
    }
    
    func testWhenServiceRequestFails_and_noCache_should_returnFailureMessage() throws {
        // When
        service.expect(.failure(.unknownError))
        let expectation = expectation(description: "service expectation")

        // Given
        repo.getListings { result in
            expectation.fulfill()
            switch result {
            case .success:
                fatalError("should return error")
            default:
                break
            }
        }
        waitForExpectations(timeout: 1)
    }
    
    func testWhenServiceRequestSucceed_and_noCache_should_returnSuccessMessage() throws {
        // When
        service.expect(.success(Listings()))
        let expectation = expectation(description: "service expectation")

        // Given
        repo.getListings { result in
            expectation.fulfill()
            switch result {
            case .failure:
                fatalError("should return error")
            default:
                break
            }
        }
        waitForExpectations(timeout: 1)
    }
}
