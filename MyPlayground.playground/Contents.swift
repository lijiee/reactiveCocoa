//: Playground - noun: a place where people can play

import UIKit
//变量

var str = "Hello, playground"

var myVariable = 4
//常量

let myVariableOne = "gsdgsdfgd"
//字符串的字节数

myVariable = "dgsdagnn".lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

var string = NSString.init()

var string1 =  String.init(bytes: "dsgsdgfaddgsdgadgg", length: 12, encoding: NSUTF8StringEncoding)

str = str.stringByAppendingString(string1)

var string2:String = String.init("dsgag,dsgsd,sdgas")

string.isEqualToString(string2)

string.hasSuffix(string2)

string1.hasPrefix(string2)

string2.hash

string2.hashValue

string2.componentsSeparatedByString(",")

string2.componentsSeparatedByCharactersInSet(NSCharacterSet.init(charactersInString: "s"))

string2.stringByTrimmingCharactersInSet(NSCharacterSet.init(charactersInString: "d"))

string2.lowercaseString

string2.uppercaseString
//var string3 = (string2 as NSString).substringToIndex(3)
//截取字符串的两种方式

var string4 = (string2 as NSString).substringFromIndex(2)

var string5 = (string2 as NSString).substringWithRange(NSRange.init(location: 2, length: 5))

string2.substringFromIndex(string2.endIndex.advancedBy(-4))
//数组的初始化及常用的方法

var array = Array.init(arrayLiteral: "dfsd","dsfs","dfsg")

var arr = NSArray.init(object: "ddsgs")

array.append("dfsdf")

array.contains("dfsdf")

array.first

array.last

array.removeAtIndex(1)

print(array)

array.indexOf("dfsg")

var string6 = array.dropFirst()

string6.dropLast()

var dic = Dictionary.init(dictionaryLiteral: ("df" ,"0" ))
var shop:[String] = ["gdsdga","asg","adsga"]
shop += ["dsgsd"];
shop.append("ds")
shop .insert("dsgsdgs", atIndex: 0)
shop .removeAtIndex(0)
print(shop)
shop.count

for  str in shop{
    print(str)
}
var airports: Dictionary<String, Int> = ["TYO": 3, "DUB": 5]


for character in "Dog!🐶".characters {
    print(character)
}


for char in string2.characters{
    print(char)
}

if str.isEmpty{
    print(str)
}else{
    print("dog")
}
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
let cat: [Character] = ["d","f","g","s","d"]
let char = String(cat)
print(char)
var num  = 23

//元组 trubble
let trubble1 = (404,"error")
print(trubble1)


let sb : Int? = 404
let sh : String? = "dsgsgdg"
for index in 1..<5{
    print(index * 5)
    
}

var sm = ""
sm = "sdgsldgma"
var so:Character = "?"
sm.append(so)

sm.endIndex

sm.hasPrefix("sd")
sm.hasSuffix("ma?")
var arrr = [Int]()
arrr.append(3)
var arrrr = [String]()
arrrr += ["dfsd","dsgsd","sgsdg"]
var sa = arrrr[0]
let afdsfs = (arrr,arrrr)
var ssdv = [Int:String]()
var airps: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//修改和添加字典元素
airps["d"] = "dsgs"
print(airps)
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
    print(answer)
}




//函数
//有馋有返回值
func shihas(egg:Int) -> Int{
    return egg + 2
    
}
print(shihas(5))
//有参悟返回值
func shie(edf:Int)  {
    print(edf)
    
}
shie(34)
//多重返回值
func sgds(sifn:String,sg:Int) -> (Int,String){
    
    return (sg,sifn)
    
}


sgds("dfsf", sg: 90)


func sfdsg(sing:String,_ sdf:String) {
    print(sing + sdf)
}

sfdsg("dfs", "dfs")

func kdsg(s:Int = 12) {
    print(s)
}

kdsg(1)
kdsg()

func sga(nums:Int...) -> Int {
    var a = 0;
    
    for num in nums {
        a += num;
    }
    return a
    
}

sga(1,23,43,3)


//函数当产生

func swap(inout a:Int,inout b:Int) {
    
    let tem = a
    a = b
    b = tem
    print((a),(b))
    
}

var a = 12
var b = 13
swap(&a, b: &b)
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addTwoInts

func sf( mathFunction: (Int, Int) ->Int,_ a : Int,_ b : Int){
    
    print(DST_CAN)
}

sf(addTwoInts, 4, 4)
let dd = ["gds","ds","msg/","fdg","dffe"]

func bijiao(s1:String,s2:String) -> Bool {
    return s1 < s2
}

var sd = dd.sort(bijiao)


let boj = dd.sort({(a0:String,a1:String) -> Bool in return a0 > a1 })

print(boj)



let dsg = dd.sort({s1 , s2 in s1 > s2})
let df = dd.sort(>)

enum someEnumeration {
    case North
    case Sourth
    case East
    case West
    
}

print(someEnumeration.East)



class NewClass {
    var nem = 1
    var gender = "nan"
 
}
var new = NewClass.init()
new.nem = 79
new.gender = "nc"
print(new.nem,new.gender)
struct jjj {
    var ds = "dfsd"
    
}
var jj = jjj.init()
print(jj.ds)

let p = CGPointMake(23, 4)


let att = [p];
print(att)


















        
