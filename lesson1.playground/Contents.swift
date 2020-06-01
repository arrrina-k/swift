import UIKit

var a: Double = 5
var b: Double = -9
var c: Double = 4

var D: Double = (b*b - 4*a*c) //находим дискриминант

if D < 0 {
    print("нет решений")
} else if D == 0.0 {
    let r: Double = (-b)/(2*a)
    print(r)
} else {
    let r1: Double = (sqrt(D) - b)/(2*a)
    let r2: Double = (-sqrt(D) - b)/(2*a)
    print(r1)
    print(r2)
}




var k1: Double = 3
var k2: Double = 4

let S: Double = (k1 * k2)/2
let g: Double = sqrt(k1 * k1 + k2 * k2)
let P: Double = k1 + k2 + g

print(S)
print(g)
print(P)




var S1: Double = 500
var percent: Double = 10

let r: Double = (percent + 100)/100
let S2: Double = S1 * pow(r, 5)

print(S2)



