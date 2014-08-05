//02 - Swift - Intermedio
//Recordad abrir el "Asistant editor" con ⌥⌘⏎

import UIKit



//MARK: 1 Switch avanzado
//Tuplas
let p1 = (1, 2)

switch p1 {
    
case let (v,_) where v > 10:
    println("El volumen sobrepasa el tamaño estandar. Usa el envío especial")

case let (_,p) where p > 10:
    println("El peso sobrepasa el peso estandar. Usa el envío especial")
    
case (1...3,1...3):
    println("Envío económico")
    
default:
    println("Todo correcto")

}


let (v,p) = p1
if v>10 {
    println("El volumen sobrepasa el tamaño estandar. Usa el envío especial")

} else if p>10 {
    println("El peso sobrepasa el peso estandar. Usa el envío especial")

} else if v>=1 && v<=3 && p>=1 && p<=3 {
    println("Envío económico")

} else {
    println("Todo correcto")

}









//MARK: 2 Funciones y closures
//2.1 El retorno de los parámetros



//Parámetros locales
func joinString1 (s1: String, s2: String, sep: String)->String {
    return s1 + sep + s2
}
joinString1("hola", "mundo", ", ")
//Esta línea da error: los parámetros locales no se usan en la llamada
//joinString1(s1:"hola", s2:"mundo", sep:", ")



//Parámetros externos
func joinString2 (firstString s1: String, secondString s2: String, separator sep: String)->String {
    return s1 + sep + s2
}
joinString2(firstString: "hola", secondString: "mundo", separator:", ")



//Parámetros externos con fundamento
func joinString3 (#firstString: String, #secondString: String, #separator: String)->String {
    return firstString + separator + secondString
}
joinString3(firstString: "hola", secondString: "mundo", separator:", ")



//Parámetros con valores por defecto
func joinString4 (#firstString: String, #secondString: String, separator: String = ", ")->String {
    return firstString + separator + secondString
}
joinString4(firstString: "hola", secondString: "mundo")
joinString4(firstString: "hola", secondString: "mundo", separator: " >>> ")






//2.2 Funciones y tipos
//Las funciones "funcionan" como tipos. Eso significa que puedo...



//2.2.1 Crear variables de tipo función
var miFunción1:(String, String, String) -> String
miFunción1 = joinString1



//o usar la inferencia
var miFunción2 = joinString1



//2.2.2 Pasar una función como parámetro
//Abrir el histórico
func plot (trig:Double->Double) {
    for var t = -M_PI; t<M_PI; t+=0.1 {
        var v = trig(t)
    }
}

plot(sin)
plot(cos)



//2.2.3 Devolver una función en un return
func pow (exponente:Double) -> (Double)->Double {
    
    func returnFunction(base:Double) -> Double {
        return pow(base, exponente)
    }
    
    return returnFunction
    
}

let x² = pow(2)
x²(8)

let x³ = pow(3)
x³(5)


//2.3 Closures
//Son bloques de código
let nombres = ["Rita", "Esther", "Lucía", "David"]
sorted(nombres)



//2.3.1 Sintaxis estándar
func ordenInverso (s1: String, s2: String) -> Bool {
    return s1 > s2
}

sorted(nombres, ordenInverso)



//2.3.1 inline
sorted(nombres, { (s1: String, s2: String) -> Bool in
    return s1 > s2
    }
)



//2.3.2 inferencia de tipos (siempre se puede)
//sorted(C, (C, C) -> Bool))
sorted(nombres, { s1, s2 in
    return s1 > s2
    }
)



//2.3.3 sentencia única, podemos cargarnos el return
sorted(nombres, { s1, s2 in s1 > s2})



//2.3.4 argumentos abreviados
sorted(nombres, {$0 > $1})



//2.3.5 y para acabar de liarla: trailing closure
sorted(nombres){$0 > $1}
sorted(nombres,>)



//2.4 map, filter y reduce
let numbers = [1,2,3,4,5,6]

numbers.map {
    (v:Int) -> Int in
    return v*10
}

var newArrayMap = [Int]()
for v in numbers {
    newArrayMap += v*10
}

numbers.map {$0*10}



numbers.filter{
    (v:Int) -> Bool in
    v%2 == 0
}

var newArrayFilter = [Int]()
for v in numbers {
    if v%2 == 0 {
        newArrayFilter+=v
    }
}

numbers.filter{ $0%2 == 0 }



//TODO: Falta ejemplo de reduce



//2.5 Capturar valores
//Ver 2.2.3 









//MARK: 3 Enumeraciones avanzadas
enum Matrículas {
    case hasta2000(String, Int, String)
    case desde2000(Int, String)
    var description: String {
        switch self{
        case let .hasta2000(provincia, número, letra):
            return provincia + " " + String(número) + " " + letra
        case let .desde2000(número, letra):
            return String(número) + " " + letra
            
        }
    }
}

let matrículaVieja = Matrículas.hasta2000("M", 1954, "ZV")
let matrículaNueva = Matrículas.desde2000(2932, "AGF")

matrículaVieja.description
matrículaNueva.description








//MARK: 4 Clases / Estructuras
class Minion {
    
    var name:String?
    var hobby: String?
    
    init (name:String?, hobby:String?) {
        self.name = name
        self.hobby = hobby
    }
    
    func description()->String{
        
        //Primer intento
        return "Minion \(name) likes \(hobby)"
        
        //Segundo intento
//        if let name = name && let hobby == hobby{
//        }
        
        //Tercer intento
//        if let name = name {
//            if let hobby = hobby {
//                return "Minion \(name) likes \(hobby)"
//            } else {
//               return "Minion \(name) likes bananas"
//            }
//        } else {
//            if let hobby = hobby {
//                return "A minion likes \(hobby)"
//            } else {
//                return "All minions like bananas"
//            }
//        }

        //Cuarto intento
//        if let(name, hobby) = (name,hobby) {
//            return "Minion \(name) likes \(hobby)"
//        } else {
//            return "mong"
//        }
        
        
        //Quinto intento
//        switch(name, hobby) {
//        case let (.Some(name), .Some(hobby)):
//            return "Minion \(name) likes \(hobby)"
//        case let(.Some(name), .None):
//            return "Minion \(name) likes bananas"
//        case let (.None, .Some(hobby)):
//            return "A minion likes \(hobby)"
//        case let (.None, .None):
//            return "All minions like bananas"
//        }
    }

    
}

var minion = Minion(name: "Frank", hobby: "lala")
minion.description()



//4.1 Acceso a subpropiedades
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var res = Resolution()
    var FPS = 0.0
    var name = ""
}

var VGA = VideoMode()
VGA.res.width = 640
VGA.res.height = 480
VGA.res = Resolution(width: 640, height: 480)



//IMPORTANTE: las esctructuras y las enumeraciones se copian, las clases se referencian. Esto afecta a las asignaciones y al let
let HD = VideoMode()
HD.FPS = 30.0
HD.name = "1080i"



//4.2 Identidad e igualdad
let HD2 = HD
if HD===HD2 {
    println("HD y HD2 son idénticos")
}



//4.3 Clases vs. Estructuras
//Estructuras para cosas sencillas. Se copian. No heredan. Strings, arrays y diccionarios se copian.
//Clases para cosas complejas. Por referencia. Herencia múltiple



//4.4 Propiedades almacenadas y calculadas
//Variables de instancia
//Lazy



//Las variables calculadas no almacenan un valor, sino que propocionan un get y un set
struct point {
    var x:Float=0, y:Float=0
}

struct Rectangle {
    var esquina1 = point()
    var esquina2 = point()
    var ancho:Float {
        get {
            return abs(esquina2.x - esquina1.x)
        }
        set (nuevoAncho){
            esquina2.x = esquina1.x + nuevoAncho
        }
    }
}

//Obsérvese que el constructor te lo da el sistema automáticamente
var rect = Rectangle(esquina1: point(x: 0, y: 0), esquina2: point(x: 100,y: 100))
rect.ancho
rect.ancho = 200
rect

//Si es sólo get, podemos simplificar

