/*:
 # Od Jave do Swifta
 
 # Glavne podobnosti med Javo in Swiftom
 * oba primarno objektno orientirana jezika
 * oba podpirata dedovanje
 * oba statično tipizirana
 * oba močno tipizirana
 */
//: # Uvod v Swift v primerjavi z Javo
/*:
 ## Uporaba
 ### Java
 Kot vemo je Java eden izmed najbolj poznanih jezikov in se uporablja vse od razvoja Android aplikacij, strežniških aplikacij, spletnih aplikacij itd. 
 ### Swift
 Swift je primarno uporabljen za razvoj iOS in macOS aplikacij, vendar se počasi prebija tudi na trg Linux strežniških aplikacij.
 ## Spremenljivke in konstante
 Ker je Swift tako kot Java statično tipiziran jezik, dobi spremenljivka ob inicializaciji tip, ki ga naknadno ne moremo spreminjati.
 
 ## Definicija spremenljivke
 ### Java
 ```String fooVariable = "some string";```
 ### Swift
 */
var fooVariable: String = "some string"
//: Takoj opazimo, da Swift ne potrebuje `;` ob koncu vrstic tako kot jih Java
/*:
 ## Definicija konstante
 ### Java
 ```final String fooConstant = "some string";```
 ### Swift
 */
let fooConstant: String = "some string"
/*:
 ## Type inference
 V Swiftu poznamo koncept "type inference-a", kar pomeni, da lahko tip spremenljivke/konstante ne definiramo eksplicitno ampak implicitno (deklaracijo tipa izpustimo in prepustimo prevajalniku da iz inicializacije določi tip)
 */
var string = "some string"
let integer = 1
let double = 1.5
//: Preverimo implicitne tipe
type(of: string)
type(of: integer)
type(of: double)
/*:
 ## Funkcije
 ### Java
 ```
 void doSomething(int parameter1, String parameter2) {
    System.out.println("Doing something");
 }
 String returnSomething(int parameter1, String parameter2) {
    return "foo";
 }
 void 
 ```
 ### Swift
 */
func doSomething(parameter1: Int, parameter2: String) {
    print("Doing something")
}
func returnSomething(parameter1: Int, parameter2: String) -> String {
    return "foo"
}
//: V Swiftu definiramo tip, ki ga funkcije vrne, na koncu definicije s pomočjo simbola ->. Če tega ne naredimo se privzame, da funkcija vrača tip Void.
/*:
 ### Imenovani parametri
 V Swiftu lahko uporabljamo imenovanje parametrov. Če ime parametra ni posebej navedeno, bo ob klicu funkcije ime parametra kar dejansko ime parametra.
 */
func functionWithNamedParameter(nameOfParameter1 parameter1: Int, nameOfParameter2 parameter2: String) -> String {
    return "foo"
}
functionWithNamedParameter(nameOfParameter1: 10, nameOfParameter2: "some string")
//: Če pa nočemo imena parametra v klicu funkcije
func functionWithoutParameterNames(_ parameter1: Int, _ parameter2: String) -> String {
    return "foo"
}
functionWithoutParameterNames(10, "some string")
/*:
 ## Opcijski tipi
 V Javi ima lahko vsaka spremenljivka, ki ima za tip nek Objekt, vrednost `null`. Kot vemo, če kličemo kaj na objektu, ki ima vrednost `null`, dobimo `NullPointerException`, ki je hkrati ena najbolj pogostih napak/težav v Javi.
 
 Swift ta problem rešuje z uporabo opcijskih tipov in je `nil` lahko vrednost le pri opcijskem tipu. Glavna "sintaksna" orodja pri tem sta `?` in `!`.
 */
var optionalVariable: String? = nil
optionalVariable =  "something mysterious"
func returnOptionalResults() -> String? {
    return nil
}
returnOptionalResults()
/*:
 ## Varno odpiranje opcijskih tipov
 ### if let stavek
 */
if let unwrappedVariableWithIfLet = optionalVariable {
    unwrappedVariableWithIfLet.count
}
/*:
 ### Opcijsko veriženje (optional chaining)
 Če opcijska spremenljivka ni `nil` potem bo `?` za spremenljivko vrnil neopcijsko vrednost, drugače pa `nil`.
 */

//optionalVariable = nil
optionalVariable?.count
/*:
 ## Nevarno odpiranje opcijskih tipov
 ### Prisilno odpiranje (force unwrapping)
 Če opcijska spremenljivka ni `nil` potem bo `!` za spremenljivko vrnil neopcijsko vrednost, drugače pa bo prišlo do napake med izvajanjem.
 */
//optionalVariable = nil
//optionalVariable!.count
/*:
 Uporaba opcijskih tipov povečuje varnost programiranja, zato je njihovo uporaba v Swiftu močno priporočena. Med programiranjem se izogibamo uporabi `!` (prisilno odpiranje).
 */
/*:
 ## Razredi
 ### Java
 ```
 class Car {
 
     private String brand;
     private String model;
     private int modelYear;
     private String nickname;
     
     public Car(String brand, String model, int modelYear, String nickname) {
         this.brand = brand;
         this.model = model;
         this.modelYear = modelYear;
         this.nickname = nickname;
     }
     
     public String getBrand() {
        return brand;
     }
     public String getModel() {
        return model;
     }
     public int getModelYear() {
        return modelYear;
     }
     private String getNickname() {
        return nickname;
     }
     public void setBrand(String brand) {
        this.brand = brand;
     }
     public void setModel(String model) {
        this.model = model;
     }
     public void setModelYear(int modelYear) {
        this.modelYear = modelYear;
     }
     private void setNickname(String nickname) {
        this.nickname = nickname;
     }
 
     public void honk() {
        System.out.println("beeep!");
     }
 }
 ```
 ### Swift
 */
class Car {
    
    var brand: String
    var model: String
    var modelYear: Int
    private var nickname: String
    
    var computedName: String {
        return "\(brand), \(model), \(modelYear)"
    }
    
    init(brand: String, model: String, modelYear: Int, nickname: String) {
        self.brand = brand
        self.model = model
        self.modelYear = modelYear
        self.nickname = nickname
    }
    
    func honk() {
        print("beeep")
    }
}
/*:
 ## Inicializacija
 ### Java
 ```
 Car myBmw = new Car("BMW", "330d", 2011, "Bimer");
 ```
 ### Swift
 */
var myBmw = Car(brand: "BMW", model: "330d", modelYear: 2011, nickname: "Bimer")
/*:
 ## Izračunane spremenljivke (Computed variables)
 Iz primera Swfit implementacije razreda `Car` zgoraj vidimo izračunano spremenljivko `computedName`. Ta spremenljivka ne hrani vrednosti, ampak se vsakič ob klicu evaluira na podlagi instance razreda.
 
 Izračunano spremenljivko lahko definiramo z `set` in `get` (če ni nič je privzeto `get`, kot v zgornjem primeru):
 */
class ExampleClass {
    
    // ... implementacija
    
    private var number: Int = 1
    
    var numberPlusOne: Int {
        get {
            return number + 1
        }
        set {
            self.number = newValue - 1
        }
    }
}
let exampleClass = ExampleClass()
exampleClass.numberPlusOne
exampleClass.numberPlusOne = 6
exampleClass.numberPlusOne
/*:
 ## Dedovanje
 Kot omenjeno med podobnostmi oba jezika podpirata dedovanje.
 ### Java
 ```
 class ElectricCar extends Car {
 
     private double rangeInKm;
     
     public ElectricCar(String brand, String model, int modelYear, String nickname, double rangeInKm) {
         super(brand, model, modelYear,  nickname);
         this.rangeInKm = rangeInKm;
     }
     
     public double getRangeInKm() {
        return rangeInKm;
     }
     public void setRangeInKm(double rangeInKm) {
        this.rangeInKm = rangeInKm;
     }
     
     @Override
     public void honk() {
        System.out.println("beep boop");
     }
 }
 ```
 ### Swift
 */
class ElectricCar: Car {
    
    var rangeInKm: Double
    
    init(brand: String, model: String, modelYear: Int, nickname: String, rangeInKm: Double) {
        self.rangeInKm = rangeInKm
        super.init(brand: brand, model: model, modelYear: modelYear, nickname: nickname)
    }
    
    override func honk() {
        print("beep boop")
    }
    
}
/*:
 ## Interface (Java) vs protocol (Swift)
 `interface` v Javi poznamo in predstavlja nekakšno okostje razreda. Iz interface-a ne moremo narediti instance, ampak ga lahko razred implementira. Interface lahko podobno kot razred deduje od drugega interface-e.
 
 V Swiftu je ekvivalent `protocol` in deluje zelo podobno kot interface, le da lahko v njem definiramo še spremenljivke poleg funkcij in konstant. Vse kar je definirano v protokolu mora biti implementirano v razredu, isto kot pri Javinem interface-u. Zopet prav tako kot v Javi, ima lahko razred več protokolov, kar definiramo tako, da jih ločimo z vejico (`class Something: Protocol1, Protocol2, Protocol3 { ... }`).
 ### Java
 ```
 interface Animal {
    public void move();
 }
 interface Mammal extends Animal {
    public int numberOfLegs();
 }
 class Cat implements Mammal {
     public void move() {
        System.out.println("Cat is moving");
     }
     public int numberOfLegs() {
        return 4;
     }
 }
 ```
 ### Swift
 */
protocol Animal {
    var isAlive: Bool { get set }
    func move()
}
protocol Mammal: Animal {
    func numberOfLegs() -> Int
}
class Cat: Mammal {
    var isAlive: Bool = true
    func move() {
        print("Cat is moving")
    }
    func numberOfLegs() -> Int {
        return 4
    }
}
/*:
 V protokolu `Animal` vidimo primer spremenljivke. Pri vsaki definiciji spremenljivke v protokolu moramo določiti tudi ali jo lahko spreminjamo ali ne:
 * samo dostop: `{ get }`
 * dostop in nastavljanje: `{ get set }`
 */
/*:
 ## Referenca vs vrednost ob preverjanju enakosti
 ### Java
 Če ima nekaj v Javi kot tip primitiv (`int`, `double`, `boolean` ...) potem bo ob dostopu vrnjena vrednost, če pa je tip objekt, potem bo vrnjen naslov kjer se ta objekt nahaja. Zato, če hočemo primerjati vrednost v Javi za primitive uporabljamo `==` operator, za objekte pa metodo `equals`, saj bi z operatorjem `==` primerjali naslova Objektov in ne njuno vrednost.
 ```
 String a = "hey";
 String b = "hey";
 
 if (a == b) {
    System.out.println("Equal");
 } else {
    System.out.println("Not equal");
 }
 
 if (a.equals(b)) {
    System.out.println("Equal");
 } else {
    System.out.println("Not equal");
 }
 ```
 V Swiftu so vrednostni tipi (value types): `struct`, `enum` in `tuple`, objekti so pa referenčni tipi. Za primerjanje po vrednosti uporabljamo `==`, za primerjanje po referenci pa `===`. Upoštevati moramo, da če gre za vrednostni tip `===` ne moremo uporabiti. Če pa gre za referenčni tip pa lahko uporabimo `==` le če se objekt prilagaja protokolu `Equatable`. Velja omeniti da so vsi osnovni tipi v Swiftu (`Int`, `Double`, `Bool`, `String` ... implementirani kot strukture (`struct`), tako da gre za referenčne tipe. Do klasičnih primitivov, kot jih poznamo v Javi, pa nimamo dostopa.
 */
class Number: Equatable {
    var integer: Int
    
    init(integer: Int) {
        self.integer = integer
    }
    
    public static func ==(lhs: Number, rhs: Number) -> Bool {
        return lhs.integer == rhs.integer
    }
}
let n1 = Number(integer: 1)
let n2 = Number(integer: 1)
n1 == n2
n1 === n2
/*:
 ## Upravljanje s spominom
 ### Java
 V splošnem za spomin v Javi skrbi t.i. "Garbage collector". V podrobnosti se ne bomo spuščali, kar je pomembno za uporabnika pa je, da njemu ni treba skrbeti za upravljanje s spominom. Za objekt lahko napišemo konstruktor, destruktorja pa ne.
 ### Swift
 Swift za upravljanje s spominom uporablja ARC (Automatic Referece Counting). ARC deluje tako, da za vsako instanco objekta hrani število referenc nanj. Dokler je to število večje od 0, instanca ne bo dealocirana in ko bo to število 0 oziroma ne bo obstajala nobena referenca nanj, bo instance dealocirana. Za objekt lahko napišemo konstruktor (`init`) in destruktor (`deinit`).
 */
class MemoryExample {
    
    init() {
        print("class instance initialization")
    }
    deinit {
        print("class instance deinitialization")
    }
    
}

var reference: MemoryExample? = nil
reference = MemoryExample()
reference = nil

/*:
 ## Močen referenčni cikel
 V večini primerov za upravljanje s spominom v Swiftu uporabnik ne rabi skrbeti. Razen v primeru kadar pride do močnega referenčnega cikla (strong reference cycle oziroma retain cycle). Do tega pride takrat, kadar imata dve instanci močno referenco druga na drugo. Poglejmo si kar primer iz [Swiftove dokumentacije](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID48).
 */
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
//: Sedaj imamo močno referenco (preko spremenljivke `John`) na instanco tipa `Person` in močno referenco (preko spremenljivke `uni4A`) na instanco tip `Apartment`, kar lahko vidimo na sliki:

//: ![](referenceCycle01_2x.png)
john!.apartment = unit4A
unit4A!.tenant = john
//: Sedaj imamo močno referenco med instancama v obe smeri, kar lahko vidimo na sliki:

//: ![](referenceCycle02_2x.png)
john = nil
unit4A = nil
//: Sedaj izgubimo reference na instanci od zunaj, vendar druga na drugo še vedno kažeta. Ustvarili smo močen referenčni cikel, ki ga ni mogoče razbiti, saj nimamo možnosti dostopa do instanc. To seveda povzroča memory leak, kar ni dobro. Situacijo vidimo na sliki:

//: ![](referenceCycle03_2x.png)
/*:
 Takšne primere ponavadi rešujemo z uporabo `weak` pred eno izmed spremenljivk razreda, ki ima referenco na drugo instanco. Pri zgornjem primeru bi to bil recimo `tenant` v `Apartment`, kar bi izgledalo kot ```weak var tenant: Person?```. Na ta način ne dobimo cikla močnih referenc, ker je ena izmed njih šibka (weak). 
 */
/*:
 # Za konec
 Na koncu velja še omeniti, da je Swift odprtoken jezik in je še več informacij o njem na voljo na [Swift Foundation](https://swiftfoundation.org).
 
 Poleg tega pa Swift še ni končan jezik in se z novimi verzijami še spreminja, kar pomeni, da lahko nova verzija prilagajanje v kodi stare verzije. Trenutno aktualna verzija je Swift 4.
 */
