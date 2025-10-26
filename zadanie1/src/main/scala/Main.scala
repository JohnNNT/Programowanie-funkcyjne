package app

object FormJsonPost extends cask.MainRoutes{
  @cask.postJson("/isSorted")
  def jsonEndpoint(values: Seq[Int], operation: ujson.Value) = {
    "X" + values + " omega " + operation
  }
  
  initialize()
}