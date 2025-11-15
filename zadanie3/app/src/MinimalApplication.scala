package app
object MinimalApplication extends cask.MainRoutes:
  override def host: String = "0.0.0.0"

  @cask.get("/")
  def hello() =
    "Hello World!"

  @cask.post("/do-thing")
  def doThing(request: cask.Request) =
    request.text().reverse

  initialize()
