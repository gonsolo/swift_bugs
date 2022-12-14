# Bug status

## Large arrays

### Open

* Creating an array with 10.000 elements is slow with optimization
  https://github.com/apple/swift/issues/50243
  Slow. Open.
  (SR-7703)

* Inliner exhibits slow compilation time with a large static array 
  https://github.com/apple/swift/issues/51712
  Slow with "-O". Open.
  (SR-9223)

* SIGSEGV with large array in SILGen
  https://github.com/apple/swift/issues/51762
  Doesn't crash anymore. Still slow. Open.
  (SR-9291)

### Fixed but still open

* SILVerifier ist still very slow with large arrays
  https://github.com/apple/swift/issues/50242
  Works. Still open. (SR-7702)

### Closed

* RedundantLoadElimination is slow with a large static array
  https://github.com/apple/swift/issues/51723
  Duplicate of 7703.
  (SR-9235)

* Initializing an Int Array with 2000 elements takes more than 4 seconds
  Fixed in https://github.com/apple/swift/pull/16560
  SR-7632

## Others

### Fixed but still open

* Internal compiler error in AllocBoxToStack.cpp
  https://github.com/apple/swift/issues/55683
  Works. Still open.
  (SR-13243)

### Closed

* scanDouble error
  Fixed in https://github.com/apple/swift-corelibs-foundation/pull/2552
  (SR-11687)

* Scanner get line comments wrong
  Invalid. Closed.
  (SR-11875)

