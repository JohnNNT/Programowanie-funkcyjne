package app

import cask.endpoints.JsonData.JsonDataImpl

object MinimalApplication extends cask.MainRoutes:
  override def host: String = "0.0.0.0"

  @cask.postJson("/removeFirst")
  def doThing(list: Seq[Int]) =
    val noHead = list match
      case Nil => Seq()
      case head :: tail => tail
      case _ => Seq()

    upickle.write(noHead)

  initialize()
