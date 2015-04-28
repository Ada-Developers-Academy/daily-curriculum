# Object Oriented Design/Programming

Object Orientaion is a *programming paradigm* focused on using the
abstraction of objects to reduce complexity in software design. It's
fundamentally an approach to problem solving.


## Rules of Thumb

1. Data should be hidden within its class.

1. Users of a class will be dependent on its public interface. But a
   class should not be dependent on its users.

1. Minimize the number of messages in the protocol of a class.

1. Keep implementation details out of the public interface for a class.

1. Don't clutter the public interface with things that users of the
   class aren't interested in using.

1. A class should capture one and only one key abstraction.

1. Keep realted data and behavior in one place.

1. Be sure that the abstractions that you model are classes rather
   than the roles that the classes play.


## Glossary

<dl>
    <dt>Class</dt>
    <dd>A *class* is a unit that we use to define types of objects. A class specifies an object's
    data (via instance methods) and behavior (via methods).</dd>
    <dt>Constructor</dt>
    <dd>A *constructor* is an operation of the class (a special method in Ruby) that is responsible
    for building and initializing objects of that class. In Ruby, this is the ```initialize``` method.</dd>
    <dt>Coupling</dt>
    <dd>The amount of dependence between distinct classes. Classes with a high degree of dependence are said to be *tightly coupled*, whereas classes with less dependence are said to be *loosely coupled*.
    <dt>Destructor</dt>
    <dd>An operation of the class that is responsible for destroying an object. Ruby does not have an explicit
    destructor method.</dd>
    <dt>Encapsulation or Information Hiding</dt>
    <dd>The practice of hiding the details of how a class works (its *implementation*) from the users of that class.</dd>
    <dt>Interface</dt>
    <dd>The collection of methods that an object exposes to a user of that object. The interface
    defines the details and intention of an object's use.</dd>
    <dt>Message</dt>
    <dd>The name of an operation called on an object. An object is said to respond to a message.</dd>
    <dt>Method</dt>
    <dd>The implementation of message.</dd>
    <dt>Polymorphism</dt>
    <dd>The ability to exchange one object for another object.</dd>
    <dt>Protocol</dt>
    <dd>The list of messages to which an object can respond.</dd>
</dl>
