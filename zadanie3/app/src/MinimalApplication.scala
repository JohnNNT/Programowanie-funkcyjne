package app

import cask.endpoints.JsonData.JsonDataImpl
import cask.model.Response.Data.NumericData
import cask.model.Response.Data.WritableData

import app.createList
import app.Item

object MinimalApplication extends cask.MainRoutes:
  override def host: String = "0.0.0.0"

  // zadanie na 3.0
  @cask.postJson("/removeFirst")
  def doThing(list: Seq[Int]) =
    val newList = createList(list)
    
    newList match
      case None => "[]"
      case Some(x) => x.getTail() match 
        case None => "[]"
        case Some(y) => y.toString()
    

  initialize()
