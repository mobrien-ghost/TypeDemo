// The Swift Programming Language
// https://docs.swift.org/swift-book

import SyntaxSparrow

class TypeDemo {

    static func isTupleWithClosure<T>(_ type: T.Type) -> Bool {
        // NOTE: I need to expose the init with type syntax in SyntaxSparrow in next update, until then am wrapping in a var decl
        print(type.self)
        let sourceBuffer = "var target: \(type)"
        let variables = SyntaxTree.declarations(of: Variable.self, inSource: sourceBuffer)
        guard let variable = variables.first else { return false }
        guard case let EntityType.tuple(tuple) = variable.type else { return false }
        return tuple.elements.contains(where: { param in
            guard case let EntityType.closure(closure) = param.type else { return false }
            return closure.isVoidInput || closure.isVoidOutput
        })
    }
}
