package app

object HTTPServer extends cask.MainRoutes:

  override def host: String = "0.0.0.0"

  def add(summands: (Int,Int)): Int =
    summands(0) + summands(1)

  def sum(summands_1: Seq[Int], summands_2: Seq[Int]): Seq[Int] =
    summands_1.zip(summands_2).map(add)
     

  @cask.postJson("/sum3")
  def sum3(collection1: Seq[Int], collection2: Seq[Int], collection3: Seq[Int]) =
    sum(collection1, sum(collection2, collection3))
    

  def subtraction(values: (Int, Int)): Int =
    values(0) - values(1)


  @cask.postJson("/isSorted")
  def doThing(values: Seq[Int], operator: String) =
    val predecessors = values.init
    val successors = values.tail
    val difference = successors.diff(predecessors)

    val returnValue = operator match
      case "<" => difference.forall(_ > 0)
      case "<=" => difference.forall(_ >= 0)
      case ">" => difference.forall(_ < 0)
      case _ => difference.forall(_ <= 0)

    upickle.write(returnValue)
	
  @cask.postJson("/setHead")
  def setHead(originalList: Seq[Int], newValue: Int) =
    upickle.write(originalList)

  initialize()
