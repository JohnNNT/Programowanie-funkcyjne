error id: file:///C:/Users/tarcz/Documents/programowanie-funkcyje/Programowanie-funkcyjne/zadanie5/app/src/HTTPServer.scala:
file:///C:/Users/tarcz/Documents/programowanie-funkcyje/Programowanie-funkcyjne/zadanie5/app/src/HTTPServer.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -unique_element.
	 -unique_element#
	 -unique_element().
	 -scala/Predef.unique_element.
	 -scala/Predef.unique_element#
	 -scala/Predef.unique_element().
offset: 626
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

  class SortValue extends MapReduce[Seq[Int], Int, Int, Int]{
    override def mapper(input: Seq[Int]): Seq[keyValue[Int,Int]] = {
      val keySet = input.toSet
      val countsSeq = Seq[keyValue[Int, Int]]()

      keySet.foreach((uniqueElement) => countsSeq = cauntsSeq.append(keyValue[Int,Int](uniq@@ue_element,input.count((_ == uniqueElement)))))

      return countsSeq
    }

    override def reducer(key: Int, values: Seq[Int]): keyValue[Int, Int] = {
      return keyValue[Int, Int](1, 2)
    }
  }

  @cask.postJson("/repeatedNumbers")
  def repeatedNumbers(list: Seq[Int]) =
    
    
  initialize()

```


#### Short summary: 

empty definition using pc, found symbol in pc: 