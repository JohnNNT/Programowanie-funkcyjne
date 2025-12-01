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
      var countsSeq = Seq[keyValue[Int, Int]]()

      keySet.foreach((uniqueElement) => countsSeq = countsSeq.appended(keyValue[Int,Int](uniqueElement, input.count((_ == uniqueElement)))))

      return countsSeq
    }

    override def reducer(key: Int, values: Seq[Int]): keyValue[Int, Int] = {
      return keyValue[Int, Int](key, values.size)
    }
  }

  @cask.postJson("/repeatedNumbers")
  def repeatedNumbers(list: Seq[Int]) =
    val mapReducer = SortValue()

    val numberCounts = mapReducer.mapper(list)
    val repeatedCounts = numberCounts.filter(_.value > 1)
    val numbersWithCount = repeatedCounts.groupMap((element) => element.value)((element) => element.key).toSeq
    var resultMap = Seq[keyValue[Int,Int]]()
    numbersWithCount.foreach((countOfNumbers) => resultMap = resultMap.appended(mapReducer.reducer(countOfNumbers._1, countOfNumbers._2)))
    upickle.write(resultMap.groupMap(_.key.toString())(_.value))

  initialize()
