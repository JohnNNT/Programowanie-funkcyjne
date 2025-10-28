package app
object MinimalApplication extends cask.MainRoutes:
  @cask.get("/")
  def hello() =
    "Hello World!"

  def subtraction(values: (Int, Int)): Int =
    values(0) - values(1)

  @cask.postJson("/isSorted")
  def doThing(values: Seq[Int], operator: ujson.value) =
    val predecessors = values.init
    val successors = values.tail
    val difference = successors.zip(predecessors.zip).map(subtraction)

    operator match
      case "<" => difference.forall(_ > 0)
      case "<=" => difference.forall(_ >= 0)
      case ">" => difference.forall(_ < 0)
      case _ => difference.forall(_ <= 0)

  initialize()
