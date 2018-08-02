<p align="center" >
	<img src="/Images/logo_2048_600.png" alt="Flexible" title="Flexible">
</p>

<p align="center">
	<a href="https://swift.org">
		<img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/v/Flexible.svg">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/dt/Flexible.svg">
	</a>
	<a href="https://tldrlegal.com/license/mit-license">
		<img src="https://img.shields.io/badge/License-Apache 2.0-blue.svg?style=flat">
	</a>
</p>

## At a Glance

`Flexible` is a tool that simplifies work with arrays in Swift.

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Flexible` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4.1

## Usage

Filtering array is much easier with `Flexible`:

```swift
let sourceArray = [
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10
]

let result = sourceArray.flx
    .take(.last(count: 4))         // Take last 4 elements
    .mapped { "value = \($0)" }    // Map Int element to String value
    .where { $0 < 8 }              // Filter source elements

print(result) // ["value = 4", "value = 5", "value = 6", "value = 7"]
```

Take first 4 elements from array:

```swift
let result = sourceArray.flx
    .take(.first(count: 4))
    .noMapping()
    .noFilter()

print(result) // [1, 2, 3, 4]
```


Retrieve array with elements multiplied by 2:

```swift
let result = sourceArray.flx
    .take(.all)
    .mapped { $0 * 2 }
    .noFilter()

print(result) // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```

## License

`Flexible` is available under the Apache 2.0 license. See the [LICENSE](./LICENSE) file for more info.
