// Протокол Shape, который определяет свойство area, которое должно быть реализовано для каждой фигуры. Также представлены реализации для круга и треугольника. Круг вычисляет площадь по формуле π * r^2, а треугольник использует формулу Герона для вычисления площади и функцию isRightAngle(), чтобы проверить, является ли треугольник прямоугольным.
// Также  содержатся юнит-тесты для проверки правильности вычисления площади круга и треугольника, а также для проверки, является ли треугольник прямоугольным.

import Foundation

// Протокол для фигур
protocol Shape {
    var area: Double { get }
}

// Реализация для круга
struct Circle: Shape {
    let radius: Double
    
    var area: Double {
        return Double.pi * radius * radius
    }
}

// Реализация для треугольника
struct Triangle: Shape {
    let sideA: Double
    let sideB: Double
    let sideC: Double
    
    var area: Double {
        let s = (sideA + sideB + sideC) / 2
        return sqrt(s * (s - sideA) * (s - sideB) * (s - sideC))
    }
    
    func isRightAngle() -> Bool {
        let sides = [sideA, sideB, sideC].sorted()
        return sides[0] * sides[0] + sides[1] * sides[1] == sides[2] * sides[2]
    }
}

// Проверка прямоугольности треугольника
let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
print("Is triangle right-angled: \(triangle.isRightAngle())")

// Создание экземпляра круга
let circle = Circle(radius: 5)
print("Area of circle: \(circle.area)")

// Создание экземпляра треугольника
let triangle2 = Triangle(sideA: 3, sideB: 4, sideC: 6)
print("Area of triangle: \(triangle2.area)")

// Unit tests
import XCTest

class ShapeTests: XCTestCase {
    func testCircleArea() {
        let circle = Circle(radius: 5)
        XCTAssertEqual(circle.area, 78.53981633974483)
    }
    
    func testTriangleArea() {
        let triangle = Triangle(sideA: 3, sideB: 4, sideC: 6)
        XCTAssertEqual(triangle.area, 5.332682251925386)
    }
    
    func testRightAngleTriangle() {
        let triangle = Triangle(sideA: 3, sideB: 4, sideC: 5)
        XCTAssertTrue(triangle.isRightAngle())
    }
}

ShapeTests.defaultTestSuite.run()
