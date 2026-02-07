package app

class Item[A](_value: A, _next: Option[Item[A]] = None):
    def value = _value
    def next = _next

    def toList(currItem: Option[Item[A]] = Option(this)): List[A] = currItem match
        case None => List()
        case Some(x) => List[A](x.value) ++ toList(x.next)

    def getTail(): Option[Item[A]] = this.next

    override def toString(): String = "[" ++ this.toList().mkString(",") ++ "]"

def createList[A](init: Seq[A]): Option[Item[A]] = init match
    case Nil => None
    case x => Some(Item[A](init.head, createList(init.tail)))

