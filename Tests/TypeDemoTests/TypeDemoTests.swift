import XCTest
@testable import TypeDemo

final class TypeDemoTests: XCTestCase {

    func testExample() throws {
        XCTAssertFalse(TypeDemo.isTupleWithClosure((Int, Int).self))
        XCTAssertFalse(TypeDemo.isTupleWithClosure(([() -> Void], [() -> Void]).self))
        XCTAssertTrue(TypeDemo.isTupleWithClosure((() -> Void, Int).self))
        XCTAssertTrue(TypeDemo.isTupleWithClosure((Int, () -> Void).self))
        XCTAssertTrue(TypeDemo.isTupleWithClosure((() -> Void, () -> Void).self))
    }
}
