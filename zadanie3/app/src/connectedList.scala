package app

class Item[A](_value: A, _next: Option[Item[A]] = None):
    def value = _value
    def next = _next

    def toSeq(currItem: Option[Item[A]] = Option(this)): Seq[A] = currItem match
        case None => Seq()
        case Some(x) => Seq[A](x.value) ++ toSeq(x.next)

    def getTail(): Option[Item[A]] = this.next

    override def toString(): String = this.toSeq().toString()

def createList[A](init: Seq[A]): Option[Item[A]] = init match
    case Nil => None
    case x => Some(Item[A](init.head, createList(init.tail)))

