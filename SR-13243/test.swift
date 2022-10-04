public protocol A {
        associatedtype X: BinaryFloatingPoint
        init()
}

public struct B<C: A> {

        public init() {
                d = C()
        }

        func j() {
                var h = 0
                var i = 0

                func f() {
                        var _: C.X = 0.0
                        i = 0
                }

                func g() {
                        f()
                        h = 0
                }

                g()
        }

        var d: C 
}

