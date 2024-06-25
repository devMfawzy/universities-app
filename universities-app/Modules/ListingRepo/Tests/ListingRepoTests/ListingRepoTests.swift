import XCTest
@testable import ListingRepo

final class ListingRepoTests: XCTestCase {
    var repo: ListingRepo!
    var service: MockListingService!
    var database: MockListingDatabase!

    override func setUp() {
        super.setUp()
        service = MockListingService()
        database = MockListingDatabase()
        repo = ListingRepo(service: service, database: database)
    }
    
    override func tearDown() {
        super.tearDown()
        service = nil
        database = nil
        repo = nil
    }
    
    func test_getListings_whenServiceRequestFails_and_noCache_should_returnFailure_andCacheShouldBeEmpty() throws {
        // Given
        service.expect(.failure(.unknownError))
        let expectation = expectation(description: "service expectation")

        // When
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

        //Then
        XCTAssertTrue(database.items.isEmpty)
    }
    
    func test_getListings_whenServiceRequestSucceed_and_noCacheYet_should_returnSuccess_andCacheShouldBeSavedWithLoafedData() throws {
        // Given
        let objects = mockDTOs(count: 10)
        service.expect(.success(objects))
        let expectation = expectation(description: "service expectation")

        // When
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
        
        // Then
        XCTAssertFalse(database.items.isEmpty)
        XCTAssertEqual(database.items.map { ListingItemDTO(object: $0) }, objects)
    }
    
    func test_getListings_whenCacheContainsData_andAPIRequestFails_repositortShould_resturnCachedData() throws {
        // Given
        let cache = mockDAOs(count: 10)
        database.add(objects: cache) // simulate data cache exists
        service.expect(.failure(.unknownError)) // simulate API request fails
        let expectation = expectation(description: "load data expectation")
        let expected = cache.map { ListingItemDTO(object: $0) }
        var dataResult: ListingDTOs?

        // When
        repo.getListings { result in
            switch result {
            case .success(let listings):
                dataResult = listings
            default:
                fatalError("should succeed")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)

        //Then
        XCTAssertFalse(database.items.isEmpty)
        XCTAssertEqual(database.items, cache)
        XCTAssertEqual(dataResult, expected)
    }
    
    func test_getListings_whenCacheContainsData_andAPIRequestSucceed_repositortShould_returnDataLoadedFromAPI_andCacheIt() throws {
        // Given
        let cache = mockDAOs(count: 10)
        let apiResponseData = mockDTOs(count: 5) // different data loaded form network
        database.add(objects: cache) // simulate data cache exists
        service.expect(.success(apiResponseData)) // simulate API request succeed
        let expectation = expectation(description: "load data expectation")
        var dataResult: ListingDTOs?

        // When
        repo.getListings { result in
            switch result {
            case .success(let listings):
                dataResult = listings
            default:
                fatalError("should succeed")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)

        //Then
        XCTAssertFalse(database.items.isEmpty)
        XCTAssertEqual(database.items.count, dataResult?.count)
        XCTAssertNotEqual(database.items, cache)
        let newCachedDTOs = database.items.map { ListingItemDTO(object: $0) }
        XCTAssertEqual(newCachedDTOs, apiResponseData)
    }
}

extension ListingRepoTests {
    func mockDTOs(count: Int = 1) -> ListingDTOs {
        (1...count).map {
            ListingItemDTO(name: "name \($0)",
                           country: "Country\($0)",
                           code: "Code\($0)",
                           webPages: ["url\($0)"],
                           state: nil)
        }
    }
    
    func mockDAOs(count: Int = 1) -> ListingDAOs {
        mockDTOs(count: count).map {
            ListingItemDAO(object: $0)
        }
    }
}
