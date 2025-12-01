file:///C:/Users/tarcz/Documents/programowanie-funkcyje/Programowanie-funkcyjne/zadanie5/app/src/HTTPServer.scala
empty definition using pc, found symbol in pc: 
semanticdb not found
empty definition using fallback
non-local guesses:
	 -Int.
	 -Int#
	 -Int().
	 -scala/Predef.Int.
	 -scala/Predef.Int#
	 -scala/Predef.Int().
offset: 353
uri: file:///C:/Users/tarcz/Documents/programowanie-funkcyje/Programowanie-funkcyjne/zadanie5/app/src/HTTPServer.scala
text:
```scala
package app

object HTTPServer extends cask.MainRoutes:

  override def host: String = "0.0.0.0"

  trait MapReduce[In, Key, Value, Reduced] {
    def mapper(input: In): Seq[keyValue[Key, Value]]
    
    def reducer(key: Key, values: Seq[Value]): keyValue[Key, Reduced]
  }
  
  case class keyValue[K,V](key: K, value: V)

  class SortValue[(Int) => In@@t, Int](initialList: Seq[Int]) extends MapReduce{
    def mapper(input: (Int) => Int): Seq[Int] = {
      return Seq[Int]()
    }

    def reducer(key: Int, values: Seq[Int]): keyValue[Int, Int] = {
      return keyValue[Int, Int](1, 2)
    }
  }

  @cask.postJson("/repeatedNumbers")
  def repeatedNumbers(list: Seq[Int]) =
    
    
  initialize()

```


#### Short summary: 

empty definition using pc, found symbol in pc: 