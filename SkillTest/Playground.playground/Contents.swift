import UIKit

// 1. Напишите, для чего нужны дженерики.
// >>>> Дженерики как абстрактный тип данных, нужны для создания более гибких объектов, в плане типов данных. Например, классы структуры или функции которые на вход могут принимать различные типы но совершать с ними одни и теже действия. Помогает избавиться от повтора кода.
// 2. Укажите, чем ассоциированные типы отличаются от дженериков.
// >>>> Ассоциированные типы это теже дженерики, но только применяются исключительно для описания протоколов
// 3. Создайте функцию, которая:
//     a) получает на вход два Equatable-объекта и, в зависимости от того, равны ли они друг другу, выводит разные сообщения в лог;
func check<T: Equatable>(_ a: T, _ b: T) {
    if a == b { print("Объекты равны") } else { print("Объекты не равны") }
}
//     b) получает на вход два сравниваемых (Comparable) друг с другом значения, сравнивает их и выводит в лог наибольшее;
func isBigger<T: Comparable>(_ a: T, _ b: T) {
    if a > b { print(a) } else { print(b) }
}
//     c) получает на вход два сравниваемых (Comparable) друг с другом значения, сравнивает их и перезаписывает первый входной параметр меньшим из двух значений, а второй параметр — большим;
func isBiggerWithRecord<T: Comparable>(_ first: inout T, _ second: inout T) {
    if first > second { let temp = first ; first = second ; second = temp }
}
//     d) получает на вход две функции, которые имеют дженерик — входной параметр Т и ничего не возвращают; сама функция должна вернуть новую функцию, которая на вход получает параметр с типом Т и при своём вызове вызывает две функции и передаёт в них полученное значение (по факту объединяет две функции).
func twoFunc<T>(a: @escaping (T) -> Void, b: @escaping (T) -> Void) -> ((_ obj: T) -> Void) {
    return { t in
        a(t)
        b(t)
    }
}

// 4. Создайте расширение для:
//     a) Array, у которого элементы имеют тип Comparable, и добавьте генерируемое свойство, которое возвращает максимальный элемент;
extension Array where Element: Comparable {
    var maximum: Element? {
        if count > 0 {
            var maxElement = first!
            forEach { value in if value > maxElement { maxElement = value } }
            return maxElement
        } else {
            return nil
        }
    }
}

var ar: [Int] = [0,3,2,8,4,2,5,3,1,3,5,6,7,8,66,4,3,5,4,2,4,55,3,4,4,2,333,3,4,3,5,1,6,2]
ar.maximum
//     b) Array, у которого элементы имеют тип Equatable, и добавьте функцию, которая удаляет из массива идентичные элементы.
extension Array where Element: Equatable {
    mutating func deleteIdentity() -> [Element] {
        var result = [Element]()
        forEach { value in if result.contains(value) == false { result.append(value) } }
        return result
    }
}
ar.deleteIdentity()

// 5. Создайте специальный оператор для:
//     a) возведения Int-числа в степень: оператор ^^, работает 2^3, возвращает 8;
infix operator ^^
func ^^(left: Int, right: Int) -> Int {
    var result = left
    for _ in 2...right { result *= left }
    return result
}
var a = 2
var b = 8

a^^b


//     b) копирования во второе Int-числа удвоенного значения первого 4 ~> a, после этого a = 8;
infix operator ~>
func ~> (left: Int, right: inout Int) -> Int {
    right = left*2
    return right
}

99 ~> a
//     c) присваивания в экземпляр tableView делегата: myController <* tableView, поле этого myController становится делегатом для tableView;
// >>>> см. ViewController

//     d) суммирует описание двух объектов с типом CustomStringConvertable и возвращает их описание: 7 + “ string” вернет “7 string”.

infix operator +
func + <T: CustomStringConvertible, U: CustomStringConvertible> (left: T, right: U) -> String {
    return left.description + right.description
}

var jj = 5 + " string"

// 6. Напишите для библиотеки анимаций новый аниматор:
//     a) изменяющий фоновый цвет для UIView;

//     b) изменяющий center UIView;

//     c) делающий scale-трансформацию для UIView.
