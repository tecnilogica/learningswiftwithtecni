//01 - Swift - Intro
//Recordad abrir el "Asistant editor" con ⌥⌘⏎

import Cocoa



//MARK: 1 TIPOS
//------------------------------------------------------
var address:String = "Doctor Fourquet 20, bajo"
var CP:Int = 28012
var CIF:String = "B83678912"



//1.1 Inferencia de tipo
var addressInf = "Doctor Fourquet 20, bajo"
var CPInf = 28012
var CIFInf = "B83678912"



//1.2 Constantes
let CIFConst = "B83678912"



//1.3 Enumeraciones 
//Sin tipo (Int por defecto)
enum TipoDeBotonSinTipo {
    case OK, Cancel, Accept
}

//Con tipo y valores
enum TipoDeBoton: Int {
    case OK = 1, Cancel, Accept
}



//Acceso y obtencíon de valores
var boton = TipoDeBotonSinTipo.Accept
println(TipoDeBoton.Cancel)
println(TipoDeBoton.Cancel.toRaw())









//MARK: 2 CADENAS
//------------------------------------------------------
//2.1 Concatenación e interpolación
var stringConcat = "Primera frase."
stringConcat += " Segunda frase."



//Esta línea dará error: no si quiero concatenar un Int tengo que hacer
//una conversión explícitamente o interpolar
//stringConcat += 123



stringConcat += " \(123) \(CIF)"



//2.2 Comparacón
if CIF=="B83678912" {
    println("A cunning plan SL")
} else {
    println("No conozco la empresa")
}



//2.3 Otras funciones
stringConcat.uppercaseString



let cadenaEntero = String(23)



//La siguiente línea devuelve un Int?, no un Int
let enteroCadena = "23".toInt()
let dobleCadena = Double("3.14".bridgeToObjectiveC().doubleValue)



//2.4 Emojis
//Se accede a ellos con Ctrl + ⌘ + Espacio
//Ojo a la longitud que devuelven los diferentes métodos
"😩".length
"😩".utf16Count
countElements("😩")









//MARK: 3 ARRAYS
//------------------------------------------------------
//3.1 Declaración
var primeNumbers = [1,2,3,5,7,11]
primeNumbers.count



//Han cambiado la forma de declarar los arrays
//Antes era var primeNumbers2:Int[] = []

var primeNumbers2:[Int]
var primeNumbers3 = [Int]()



//Esta línea da error porque primeNumbers2 está sin inicializar
//primeNumbers2.count



primeNumbers2 = []
//Ahora ya no
primeNumbers2.count



//3.2 Operaciones
primeNumbers[1]
primeNumbers.isEmpty



//Concatenación
primeNumbers += 13



//Devuelve el índice del elemento o nil
let indexOf13 = find(primeNumbers, 13)
if indexOf13 {
    println("El primo 13 se encuentra en la posición \(indexOf13)")
} else {
    println("No he encontrado el 13 en la lista")
}



//Rangos!!!
primeNumbers[0..<1] = [0,0,0,0,0]
primeNumbers

primeNumbers[0...4] = [1]
primeNumbers



//3.3 Sort, map y reduce
//De momento, para que vayan sonando



//Sort ordena los elementos
//Modifica el array original
primeNumbers.sort({a, b in a > b})
primeNumbers



//Map aplica una misma transformación a todos los elementos
//No modifica el array original
primeNumbers = primeNumbers.map({a in a * 2})
primeNumbers



//Reduce compacta el array en un único valor
//No modifica el array original
var suma = primeNumbers.reduce(0, {a,b in a + b})
suma









//MARK: 4 DICCIONARIOS
//------------------------------------------------------
//4.1 Declaración
var DNINombres = ["33779P":"Juan",
    "12312H":"Jota"]



//Declaración corta, recomendada
var DNINombres2 = [String: String]()



//Acceso
DNINombres.count
DNINombres["33779P"]
DNINombres["33"]



//Añadir y eliminar elementos
DNINombres["93494R"] = "Ant"
DNINombres

DNINombres["33779P"] = nil
DNINombres









//MARK: 5 FLUJO
//------------------------------------------------------
//5.1 Bucles con rangos, sobre arrays y diccionarios, bucles tradicionales
//También se pueden usar do y while
for f in 1..<5 {
    println(f)
}

for f in 1...5 {
    println(f)
}

for prime in primeNumbers {
    println(prime)
}

for (dni, nombre) in DNINombres {
    println("El DNI de \(nombre) es el \(dni)")
}

for var f = 1; f<5; f++ {
    println (f)
}



//5.2 Switch
//Obligatorio añadir un default
//No se usa el comando break
//Se pueden usar rangos y funciones
var asistentes = 8

switch asistentes {
  case 0: println("No va nadie")
  case 1...3: println("Necesitas llegar a cuatro asistentes")
  case 4...8: println("El curso se celebrará sin problemas")
  default: println("Hay lista de espera")
}



var nombreAsistentes = ["Juan", "David", "Chuchi",
                        "Esther", "Lucía", "Ángel",
                        "Javi", "Mario", "Fernando",
                        "José"]
for nombre in nombreAsistentes {
    switch nombre {
    case let x where countElements(x) == 4: println ("\(x) tiene cuatro letras")
    default: println (nombre)
    }
    
}









//MARK: 6 FUNCIONES
//------------------------------------------------------
//Definiión normal
func suma1 (a: Int, b: Int) -> Int {
    return a+b
}
suma1(10,20)



//Poniendo nombre a los parámetros
func suma2 (firstNumber a: Int, secondNumber b: Int) -> Int {
    return a+b
}
suma2(firstNumber:10,secondNumber:20)



//Poniendo el mismo nombre a los parámetros
func suma3 (#a: Int, #b: Int) -> Int {
    return a+b
}
suma3(a:10,b:20)



//Valores por defecto (obliga a poner nombre a algún parámetro)
func suma4 (a: Int, b: Int = 23) -> Int {
    return a+b
}
suma4(10)
suma4(10, b:90)



//Dentro de una función no se pueden modificar los parámetros
func suma5 (a: Int, b: Int) -> Int {
    //a = a + b
    return a
}



//Si queremos modificarlos, hay que declararlos como var
func suma6 (var a: Int, b: Int) -> Int {
    a = a + b
    return a
}
suma6(4, 45)



//Para pasarlos por referencia, necesitamos inout y &
//Mejor no usar
func suma7 (inout a: Int, b: Int) -> Int {
    a = a + b
    return a
}

var x = 45
suma7(&x, 5)
x



//Si por alguna razón queremos emplear una lista de parámetros en vez de un array
func sumatorio(numeros:Int...) -> Int? {
    
    if numeros.count == 0 {
        return nil;
    }
    
    var suma = 0
    for numero in numeros {
        suma += numero
    }
    
    return suma
    
}

sumatorio()
sumatorio(1,2,5,7)









//MARK: 7 CLOSURES
//------------------------------------------------------
//Bloques autocontenidos
//Similar a los lambdas en otros lenguajes o a los blocks en Objective-C
//Las funciones son un tipo de closures
//Definición
let saludeitor = {
    (nombre:String)->() in
    println ("Hola, \(nombre)")
}

saludeitor("José Luis")



//Un closure se puede usar como parámetro de una función
func repetidor(count:Int, nombre:String, tarea: (n:String)->()) {
    for f in 1...count {
        tarea(n:nombre)
    }
}

repetidor(5,"José Luis",saludeitor)









//MARK: 8 TIPOS AVANZADOS
//------------------------------------------------------
//8.1 Opcionales

var opcionElegida:Int? = 3

if opcionElegida {
    //La línea "var indice..." da error: Aunque sabemos que opcionElegida tiene
    //un valor, el compilador nos obliga a hacer un unwrap
    //    var indice:Int = opcionElegida - 1
}

//Una posible solución es indicar al compilador que sí, que hay valor (!)
if opcionElegida {
    var indice:Int = opcionElegida! - 1
}

//Otra opción es hacer el unwrap en el if
if var indice = opcionElegida {
    indice--
}



//8.2 Tuplas
func getServerStatus() -> (Int, String) {
    return (404, "Not found")
}

//Accedemos a los parámetros por índice
var status = getServerStatus()
status.0
status.1

//o por nombre
let (codigo, mensaje) = getServerStatus()
codigo
mensaje



//También podemos definir el nombre en los parámetros de la función
func getServerStatus2() -> (codigo:Int, mensaje:String) {
    return (404, "Not found")
}

var status2 = getServerStatus2()
status2.codigo
status2.mensaje



//8.3 Estructuras - Definición
struct Pixel1 {
    var x,y: Int
    var color: Int
}

var p1 = Pixel1(x: 0, y: 0, color: 0x700000)



//8.3.1 Estructuras - computed properties
//Creamos una propiedad de sólo lectura llamada redComponent
//que nos devuelve el R del RGB.
struct Pixel2 {
    
    var x,y: Int
    var color: Int
    
    var redComponent: Int {
        return (color & 0xff0000) >> 16
    }
    
}

var p2 = Pixel2(x: 0, y: 0, color: 0x700000)
p2.redComponent



//8.3.2 Estructuras - funciones
struct Pixel3 {
    
    var x,y: Int
    var color: Int
    
    var redComponent: Int {
        return (color & 0xff0000) >> 16
    }
    
    func isEqualTo(otherPixel:Pixel3) -> Bool {
        return otherPixel.x == x && otherPixel.y == y
    }
    
}

var p3 = Pixel3(x: 0, y: 0, color: 0x700000)
p3.isEqualTo(Pixel3(x: 0, y: 0, color: 0xFFFFFF))
p3.isEqualTo(Pixel3(x: 100, y: 0, color: 0xFFFFFF))



//8.4 Enumeraciones - El retorno
//Podemos definir los valores de una enum como cadenas
enum EstadoDeAnimo1: Character {
    case caca = "💩"
    case flamenca = "💃"
}

//Primera forma de asignar un valor
var e1a:EstadoDeAnimo1 = .caca

//Segunda forma de asignar un valor
var e1b = EstadoDeAnimo1.caca



//Podemos asignar un valor por defecto, y también añadir 
//propiedades calculadas.
enum EstadoDeAnimo2: Character {
    case caca = "💩"
    case flamenca = "💃"
    init() {
        self = flamenca
    }
    var description: String {
        return "Hoy me siento \(self.toRaw())"
    }
}

//La declaración cambia ligeramente.
var e2 = EstadoDeAnimo2()
e2.description









//MARK: 9 CLASES
//------------------------------------------------------
//9.1 Definición. Igual que en los enums y structs, podemos usar 
//propiedades calculadas
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "Tiene \(numberOfWheels) ruedas"
    }
}
var coche = Vehicle()
coche.description



//9.2 Herencia
//Si queremos modificar alguna propiedad, necesitamos usar init()
//Si queremos sobreescribir un método del padre, tenemos que añadir 'override'
class Bicycle: Vehicle {
    init() {
        super.init()
        numberOfWheels = 2
    }
    override var description: String {
    return "Es una bici y " + super.description
    }
}

var bici = Bicycle()
bici.description



//9.3 willSet y didSet
//willSet se ejecuta antes de cambiar el valor de una propiedad
//didSet se ejecuta justo después de cambiar el valor de una propiedad
class BicicletaProtectora: Bicycle {
    
    var numberOfAccidents: Int = 0 {
    
        willSet {
            //Se puede acceder al nuevo valor con newValue
            if newValue > 4 {
                println("¿Seguro que la bici es lo tuyo?")
            }
        }
        didSet {
            //Se puede acceder al valor antiguo con oldValue
            println("Tortazos actualizados")
        }
    }
    
    func tortazo() {
        numberOfAccidents++
    }
    
}

var biciRespondona = BicicletaProtectora()
biciRespondona.tortazo()
biciRespondona.tortazo()
biciRespondona.tortazo()
biciRespondona.tortazo()
biciRespondona.tortazo()
