# HTTP and Other Protocols

A computer network is a collection of computers and devices connected using communication devices (routers, cables, wifi).

Computers communicate over a network by sending data over the connection.

There are many types of networks and architectures, but we're going to look primarily at the internet and client/server architecture.

## Client/Server

A **Server** is a computer that provides a service to clients.

A **Client** is a computer that requests services from a server (your web browser, an ATM, your phone)

![Client Server](networking/client-server.png)

## Communication (HTTP)

Hypertext Transfer Protocol (HTTP) functions as a __request-response__ protocol.

A client sends an __request__ and a server sends back an __response__. HTTP describes how that request and response are formatted. There are lots of different protocols that describe lots of different kinds of interactions. Common protocols utilized in networked or internet-based applications include HTTP and HTTPS (hypertext transfer protocol secured), IMAP, FTP, SSH, SMTP, LDAP, DHCP, and more.

All of these are, at the end of the day, just text sent over the network. A suite of technologies take this text, carry it to the intended destination, and make sense of it.

```ruby
# making an http request
Socket.tcp("localhost", 3000) {|sock|
  sock.print "GET / HTTP/1.1\r\n\r\n"
  sock.close_write
  puts sock.read
}
```

```
GET / HTTP/1.1
User-Agent: curl/7.30.0
Host: localhost:8080
Content-Length: 6
Accept: */*

order_item[product_id]=4
```

```
# and the corresponding response
HTTP/1.1 200 OK
Content-Type: text/html
Server: WEBrick/1.3.1 (Ruby/2.1.2/2014-05-08)
Date: Mon, 22 Sep 2014 19:19:57 GMT
Content-Length: 21
Connection: Keep-Alive
```

## Web Server
The webserver is a running process on the server which monitors incoming HTTP requests
and respond with an HTTP response. In simpler times, the web server would simply locate
an HTML file then read and return the contents.

For our purposes we won't be using statically saved HTML files, but we'll use ruby
to generate the HTML content dynamically each time a request is made.

A webserver interfaces your application with incoming HTTP requests on the server.

![The Request Cycle](networking/request-cycle.jpg)
