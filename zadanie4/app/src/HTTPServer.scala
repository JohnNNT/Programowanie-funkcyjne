package app

object HTTPServer extends cask.MainRoutes:

  override def host: String = "0.0.0.0"

  @cask.postJson("/append")
  def appendOption(list: Seq[Int], position: Int, newValue: Int) =
    val newList = Option(list.slice(0,position).appended(newValue).concat(list.slice(position,list.size)))
    upickle.write(newList.getOrElse(list))
    
  initialize()
