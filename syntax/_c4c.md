
# C4 Diagrams

> C4 Diagram: This is an experimental diagram for now. The syntax and
> properties can change in future releases. Proper documentation will be
> provided when the syntax is stable.

Mermaid’s c4 diagram syntax is compatible with plantUML. See example
below:

``` mermaid
    C4Context
      title System Context diagram for Internet Banking System
      Enterprise_Boundary(b0, &quot;BankBoundary0&quot;) {
        Person(customerA, &quot;Banking Customer A&quot;, &quot;A customer of the bank, with personal bank accounts.&quot;)
        Person(customerB, &quot;Banking Customer B&quot;)
        Person_Ext(customerC, &quot;Banking Customer C&quot;, &quot;desc&quot;)

        Person(customerD, &quot;Banking Customer D&quot;, &quot;A customer of the bank, &lt;br/&gt; with personal bank accounts.&quot;)

        System(SystemAA, &quot;Internet Banking System&quot;, &quot;Allows customers to view information about their bank accounts, and make payments.&quot;)

        Enterprise_Boundary(b1, &quot;BankBoundary&quot;) {

          SystemDb_Ext(SystemE, &quot;Mainframe Banking System&quot;, &quot;Stores all of the core banking information about customers, accounts, transactions, etc.&quot;)

          System_Boundary(b2, &quot;BankBoundary2&quot;) {
            System(SystemA, &quot;Banking System A&quot;)
            System(SystemB, &quot;Banking System B&quot;, &quot;A system of the bank, with personal bank accounts. next line.&quot;)
          }

          System_Ext(SystemC, &quot;E-mail system&quot;, &quot;The internal Microsoft Exchange e-mail system.&quot;)
          SystemDb(SystemD, &quot;Banking System D Database&quot;, &quot;A system of the bank, with personal bank accounts.&quot;)

          Boundary(b3, &quot;BankBoundary3&quot;, &quot;boundary&quot;) {
            SystemQueue(SystemF, &quot;Banking System F Queue&quot;, &quot;A system of the bank.&quot;)
            SystemQueue_Ext(SystemG, &quot;Banking System G Queue&quot;, &quot;A system of the bank, with personal bank accounts.&quot;)
          }
        }
      }

      BiRel(customerA, SystemAA, &quot;Uses&quot;)
      BiRel(SystemAA, SystemE, &quot;Uses&quot;)
      Rel(SystemAA, SystemC, &quot;Sends e-mails&quot;, &quot;SMTP&quot;)
      Rel(SystemC, customerA, &quot;Sends e-mails to&quot;)

      UpdateElementStyle(customerA, $fontColor=&quot;red&quot;, $bgColor=&quot;grey&quot;, $borderColor=&quot;red&quot;)
      UpdateRelStyle(customerA, SystemAA, $textColor=&quot;blue&quot;, $lineColor=&quot;blue&quot;, $offsetX=&quot;5&quot;)
      UpdateRelStyle(SystemAA, SystemE, $textColor=&quot;blue&quot;, $lineColor=&quot;blue&quot;, $offsetY=&quot;-10&quot;)
      UpdateRelStyle(SystemAA, SystemC, $textColor=&quot;blue&quot;, $lineColor=&quot;blue&quot;, $offsetY=&quot;-40&quot;, $offsetX=&quot;-50&quot;)
      UpdateRelStyle(SystemC, customerA, $textColor=&quot;red&quot;, $lineColor=&quot;red&quot;, $offsetX=&quot;-50&quot;, $offsetY=&quot;20&quot;)

      UpdateLayoutConfig($c4ShapeInRow=&quot;3&quot;, $c4BoundaryInRow=&quot;1&quot;)


```

For an example, see the source code demos/index.html

5 types of C4 charts are supported.

- System Context (C4Context)
- Container diagram (C4Container)
- Component diagram (C4Component)
- Dynamic diagram (C4Dynamic)
- Deployment diagram (C4Deployment)

Please refer to the linked document [C4-PlantUML
syntax](https://github.com/plantuml-stdlib/C4-PlantUML/blob/master/README.md)
for how to write the c4 diagram.

C4 diagram is fixed style, such as css color, so different css is not
provided under different skins. updateElementStyle and
UpdateElementStyle are written in the diagram last part.
updateElementStyle is inconsistent with the original definition and
updates the style of the relationship, including the offset of the text
label relative to the original position.

The layout does not use a fully automated layout algorithm. The position
of shapes is adjusted by changing the order in which statements are
written. So there is no plan to support the following Layout statements.
The number of shapes per row and the number of boundaries can be
adjusted using UpdateLayoutConfig.

- Layout

- - Lay_U, Lay_Up

- - Lay_D, Lay_Down

- - Lay_L, Lay_Left

- - Lay_R, Lay_Right

The following unfinished features are not supported in the short term.

- [ ] sprite

- [ ] tags

- [ ] link

- [ ] Legend

- [x] System Context

- - [x] Person(alias, label, ?descr, ?sprite, ?tags, \$link)

- - [x] Person_Ext

- - [x] System(alias, label, ?descr, ?sprite, ?tags, \$link)

- - [x] SystemDb

- - [x] SystemQueue

- - [x] System_Ext

- - [x] SystemDb_Ext

- - [x] SystemQueue_Ext

- - [x] Boundary(alias, label, ?type, ?tags, \$link)

- - [x] Enterprise_Boundary(alias, label, ?tags, \$link)

- - [x] System_Boundary

- [x] Container diagram

- - [x] Container(alias, label, ?techn, ?descr, ?sprite, ?tags, \$link)

- - [x] ContainerDb

- - [x] ContainerQueue

- - [x] Container_Ext

- - [x] ContainerDb_Ext

- - [x] ContainerQueue_Ext

- - [x] Container_Boundary(alias, label, ?tags, \$link)

- [x] Component diagram

- - [x] Component(alias, label, ?techn, ?descr, ?sprite, ?tags, \$link)

- - [x] ComponentDb

- - [x] ComponentQueue

- - [x] Component_Ext

- - [x] ComponentDb_Ext

- - [x] ComponentQueue_Ext

- [x] Dynamic diagram

- - [x] RelIndex(index, from, to, label, ?tags, \$link)

- [x] Deployment diagram

- - [x] Deployment_Node(alias, label, ?type, ?descr, ?sprite, ?tags,
    \$link)

- - [x] Node(alias, label, ?type, ?descr, ?sprite, ?tags, \$link): short
    name of Deployment_Node()

- - [x] Node_L(alias, label, ?type, ?descr, ?sprite, ?tags, \$link):
    left aligned Node()

- - [x] Node_R(alias, label, ?type, ?descr, ?sprite, ?tags, \$link):
    right aligned Node()

- [x] Relationship Types

- - [x] Rel(from, to, label, ?techn, ?descr, ?sprite, ?tags, \$link)

- - [x] BiRel (bidirectional relationship)

- - [x] Rel_U, Rel_Up

- - [x] Rel_D, Rel_Down

- - [x] Rel_L, Rel_Left

- - [x] Rel_R, Rel_Right

- - [x] Rel_Back

- - [x] RelIndex \* Compatible with C4-Plantuml syntax, but ignores the
    index parameter. The sequence number is determined by the order in
    which the rel statements are written.

- [ ] Custom tags/stereotypes support and skin param updates

- - [ ] AddElementTag(tagStereo, ?bgColor, ?fontColor, ?borderColor,
    ?shadowing, ?shape, ?sprite, ?techn, ?legendText, ?legendSprite):
    Introduces a new element tag. The styles of the tagged elements are
    updated and the tag is displayed in the calculated legend.

- - [ ] AddRelTag(tagStereo, ?textColor, ?lineColor, ?lineStyle,
    ?sprite, ?techn, ?legendText, ?legendSprite): Introduces a new
    Relationship tag. The styles of the tagged relationships are updated
    and the tag is displayed in the calculated legend.

- - [x] UpdateElementStyle(elementName, ?bgColor, ?fontColor,
    ?borderColor, ?shadowing, ?shape, ?sprite, ?techn, ?legendText,
    ?legendSprite): This call updates the default style of the elements
    (component, …) and creates no additional legend entry.

- - [x] UpdateRelStyle(from, to, ?textColor, ?lineColor, ?offsetX,
    ?offsetY): This call updates the default relationship colors and
    creates no additional legend entry. Two new parameters, offsetX and
    offsetY, are added to set the offset of the original position of the
    text.

- - [ ] RoundedBoxShape(): This call returns the name of the rounded box
    shape and can be used as ?shape argument.

- - [ ] EightSidedShape(): This call returns the name of the eight sided
    shape and can be used as ?shape argument.

- - [ ] DashedLine(): This call returns the name of the dashed line and
    can be used as ?lineStyle argument.

- - [ ] DottedLine(): This call returns the name of the dotted line and
    can be used as ?lineStyle argument.

- - [ ] BoldLine(): This call returns the name of the bold line and can
    be used as ?lineStyle argument.

- - [x] UpdateLayoutConfig(?c4ShapeInRow, ?c4BoundaryInRow): New. This
    call updates the default c4ShapeInRow(4) and c4BoundaryInRow(2).

There are two ways to assign parameters with question marks. One uses
the non-named parameter assignment method in the order of the
parameters, and the other uses the named parameter assignment method,
where the name must start with a \$ symbol.

Example: UpdateRelStyle(from, to, ?textColor, ?lineColor, ?offsetX,
?offsetY)

    UpdateRelStyle(customerA, bankA, "red", "blue", "-40", "60")
    UpdateRelStyle(customerA, bankA, $offsetX="-40", $offsetY="60", $lineColor="blue", $textColor="red")
    UpdateRelStyle(customerA, bankA, $offsetY="60")

## C4 System Context Diagram (C4Context)

``` mermaid
    C4Context
      title System Context diagram for Internet Banking System
      Enterprise_Boundary(b0, &quot;BankBoundary0&quot;) {
        Person(customerA, &quot;Banking Customer A&quot;, &quot;A customer of the bank, with personal bank accounts.&quot;)
        Person(customerB, &quot;Banking Customer B&quot;)
        Person_Ext(customerC, &quot;Banking Customer C&quot;, &quot;desc&quot;)

        Person(customerD, &quot;Banking Customer D&quot;, &quot;A customer of the bank, &lt;br/&gt; with personal bank accounts.&quot;)

        System(SystemAA, &quot;Internet Banking System&quot;, &quot;Allows customers to view information about their bank accounts, and make payments.&quot;)

        Enterprise_Boundary(b1, &quot;BankBoundary&quot;) {

          SystemDb_Ext(SystemE, &quot;Mainframe Banking System&quot;, &quot;Stores all of the core banking information about customers, accounts, transactions, etc.&quot;)

          System_Boundary(b2, &quot;BankBoundary2&quot;) {
            System(SystemA, &quot;Banking System A&quot;)
            System(SystemB, &quot;Banking System B&quot;, &quot;A system of the bank, with personal bank accounts. next line.&quot;)
          }

          System_Ext(SystemC, &quot;E-mail system&quot;, &quot;The internal Microsoft Exchange e-mail system.&quot;)
          SystemDb(SystemD, &quot;Banking System D Database&quot;, &quot;A system of the bank, with personal bank accounts.&quot;)

          Boundary(b3, &quot;BankBoundary3&quot;, &quot;boundary&quot;) {
            SystemQueue(SystemF, &quot;Banking System F Queue&quot;, &quot;A system of the bank.&quot;)
            SystemQueue_Ext(SystemG, &quot;Banking System G Queue&quot;, &quot;A system of the bank, with personal bank accounts.&quot;)
          }
        }
      }

      BiRel(customerA, SystemAA, &quot;Uses&quot;)
      BiRel(SystemAA, SystemE, &quot;Uses&quot;)
      Rel(SystemAA, SystemC, &quot;Sends e-mails&quot;, &quot;SMTP&quot;)
      Rel(SystemC, customerA, &quot;Sends e-mails to&quot;)

      UpdateElementStyle(customerA, $fontColor=&quot;red&quot;, $bgColor=&quot;grey&quot;, $borderColor=&quot;red&quot;)
      UpdateRelStyle(customerA, SystemAA, $textColor=&quot;blue&quot;, $lineColor=&quot;blue&quot;, $offsetX=&quot;5&quot;)
      UpdateRelStyle(SystemAA, SystemE, $textColor=&quot;blue&quot;, $lineColor=&quot;blue&quot;, $offsetY=&quot;-10&quot;)
      UpdateRelStyle(SystemAA, SystemC, $textColor=&quot;blue&quot;, $lineColor=&quot;blue&quot;, $offsetY=&quot;-40&quot;, $offsetX=&quot;-50&quot;)
      UpdateRelStyle(SystemC, customerA, $textColor=&quot;red&quot;, $lineColor=&quot;red&quot;, $offsetX=&quot;-50&quot;, $offsetY=&quot;20&quot;)

      UpdateLayoutConfig($c4ShapeInRow=&quot;3&quot;, $c4BoundaryInRow=&quot;1&quot;)

```

## C4 Container diagram (C4Container)

``` mermaid
    C4Container
    title Container diagram for Internet Banking System

    System_Ext(email_system, &quot;E-Mail System&quot;, &quot;The internal Microsoft Exchange system&quot;, $tags=&quot;v1.0&quot;)
    Person(customer, Customer, &quot;A customer of the bank, with personal bank accounts&quot;, $tags=&quot;v1.0&quot;)

    Container_Boundary(c1, &quot;Internet Banking&quot;) {
        Container(spa, &quot;Single-Page App&quot;, &quot;JavaScript, Angular&quot;, &quot;Provides all the Internet banking functionality to cutomers via their web browser&quot;)
        Container_Ext(mobile_app, &quot;Mobile App&quot;, &quot;C#, Xamarin&quot;, &quot;Provides a limited subset of the Internet banking functionality to customers via their mobile device&quot;)
        Container(web_app, &quot;Web Application&quot;, &quot;Java, Spring MVC&quot;, &quot;Delivers the static content and the Internet banking SPA&quot;)
        ContainerDb(database, &quot;Database&quot;, &quot;SQL Database&quot;, &quot;Stores user registration information, hashed auth credentials, access logs, etc.&quot;)
        ContainerDb_Ext(backend_api, &quot;API Application&quot;, &quot;Java, Docker Container&quot;, &quot;Provides Internet banking functionality via API&quot;)

    }

    System_Ext(banking_system, &quot;Mainframe Banking System&quot;, &quot;Stores all of the core banking information about customers, accounts, transactions, etc.&quot;)

    Rel(customer, web_app, &quot;Uses&quot;, &quot;HTTPS&quot;)
    UpdateRelStyle(customer, web_app, $offsetY=&quot;60&quot;, $offsetX=&quot;90&quot;)
    Rel(customer, spa, &quot;Uses&quot;, &quot;HTTPS&quot;)
    UpdateRelStyle(customer, spa, $offsetY=&quot;-40&quot;)
    Rel(customer, mobile_app, &quot;Uses&quot;)
    UpdateRelStyle(customer, mobile_app, $offsetY=&quot;-30&quot;)

    Rel(web_app, spa, &quot;Delivers&quot;)
    UpdateRelStyle(web_app, spa, $offsetX=&quot;130&quot;)
    Rel(spa, backend_api, &quot;Uses&quot;, &quot;async, JSON/HTTPS&quot;)
    Rel(mobile_app, backend_api, &quot;Uses&quot;, &quot;async, JSON/HTTPS&quot;)
    Rel_Back(database, backend_api, &quot;Reads from and writes to&quot;, &quot;sync, JDBC&quot;)

    Rel(email_system, customer, &quot;Sends e-mails to&quot;)
    UpdateRelStyle(email_system, customer, $offsetX=&quot;-45&quot;)
    Rel(backend_api, email_system, &quot;Sends e-mails using&quot;, &quot;sync, SMTP&quot;)
    UpdateRelStyle(backend_api, email_system, $offsetY=&quot;-60&quot;)
    Rel(backend_api, banking_system, &quot;Uses&quot;, &quot;sync/async, XML/HTTPS&quot;)
    UpdateRelStyle(backend_api, banking_system, $offsetY=&quot;-50&quot;, $offsetX=&quot;-140&quot;)

```

## C4 Component diagram (C4Component)

``` mermaid
    C4Component
    title Component diagram for Internet Banking System - API Application

    Container(spa, &quot;Single Page Application&quot;, &quot;javascript and angular&quot;, &quot;Provides all the internet banking functionality to customers via their web browser.&quot;)
    Container(ma, &quot;Mobile App&quot;, &quot;Xamarin&quot;, &quot;Provides a limited subset ot the internet banking functionality to customers via their mobile mobile device.&quot;)
    ContainerDb(db, &quot;Database&quot;, &quot;Relational Database Schema&quot;, &quot;Stores user registration information, hashed authentication credentials, access logs, etc.&quot;)
    System_Ext(mbs, &quot;Mainframe Banking System&quot;, &quot;Stores all of the core banking information about customers, accounts, transactions, etc.&quot;)

    Container_Boundary(api, &quot;API Application&quot;) {
        Component(sign, &quot;Sign In Controller&quot;, &quot;MVC Rest Controller&quot;, &quot;Allows users to sign in to the internet banking system&quot;)
        Component(accounts, &quot;Accounts Summary Controller&quot;, &quot;MVC Rest Controller&quot;, &quot;Provides customers with a summary of their bank accounts&quot;)
        Component(security, &quot;Security Component&quot;, &quot;Spring Bean&quot;, &quot;Provides functionality related to singing in, changing passwords, etc.&quot;)
        Component(mbsfacade, &quot;Mainframe Banking System Facade&quot;, &quot;Spring Bean&quot;, &quot;A facade onto the mainframe banking system.&quot;)

        Rel(sign, security, &quot;Uses&quot;)
        Rel(accounts, mbsfacade, &quot;Uses&quot;)
        Rel(security, db, &quot;Read &amp; write to&quot;, &quot;JDBC&quot;)
        Rel(mbsfacade, mbs, &quot;Uses&quot;, &quot;XML/HTTPS&quot;)
    }

    Rel_Back(spa, sign, &quot;Uses&quot;, &quot;JSON/HTTPS&quot;)
    Rel(spa, accounts, &quot;Uses&quot;, &quot;JSON/HTTPS&quot;)

    Rel(ma, sign, &quot;Uses&quot;, &quot;JSON/HTTPS&quot;)
    Rel(ma, accounts, &quot;Uses&quot;, &quot;JSON/HTTPS&quot;)

    UpdateRelStyle(spa, sign, $offsetY=&quot;-40&quot;)
    UpdateRelStyle(spa, accounts, $offsetX=&quot;40&quot;, $offsetY=&quot;40&quot;)

    UpdateRelStyle(ma, sign, $offsetX=&quot;-90&quot;, $offsetY=&quot;40&quot;)
    UpdateRelStyle(ma, accounts, $offsetY=&quot;-40&quot;)

        UpdateRelStyle(sign, security, $offsetX=&quot;-160&quot;, $offsetY=&quot;10&quot;)
        UpdateRelStyle(accounts, mbsfacade, $offsetX=&quot;140&quot;, $offsetY=&quot;10&quot;)
        UpdateRelStyle(security, db, $offsetY=&quot;-40&quot;)
        UpdateRelStyle(mbsfacade, mbs, $offsetY=&quot;-40&quot;)

```

## C4 Dynamic diagram (C4Dynamic)

``` mermaid
    C4Dynamic
    title Dynamic diagram for Internet Banking System - API Application

    ContainerDb(c4, &quot;Database&quot;, &quot;Relational Database Schema&quot;, &quot;Stores user registration information, hashed authentication credentials, access logs, etc.&quot;)
    Container(c1, &quot;Single-Page Application&quot;, &quot;JavaScript and Angular&quot;, &quot;Provides all of the Internet banking functionality to customers via their web browser.&quot;)
    Container_Boundary(b, &quot;API Application&quot;) {
      Component(c3, &quot;Security Component&quot;, &quot;Spring Bean&quot;, &quot;Provides functionality Related to signing in, changing passwords, etc.&quot;)
      Component(c2, &quot;Sign In Controller&quot;, &quot;Spring MVC Rest Controller&quot;, &quot;Allows users to sign in to the Internet Banking System.&quot;)
    }
    Rel(c1, c2, &quot;Submits credentials to&quot;, &quot;JSON/HTTPS&quot;)
    Rel(c2, c3, &quot;Calls isAuthenticated() on&quot;)
    Rel(c3, c4, &quot;select * from users where username = ?&quot;, &quot;JDBC&quot;)

    UpdateRelStyle(c1, c2, $textColor=&quot;red&quot;, $offsetY=&quot;-40&quot;)
    UpdateRelStyle(c2, c3, $textColor=&quot;red&quot;, $offsetX=&quot;-40&quot;, $offsetY=&quot;60&quot;)
    UpdateRelStyle(c3, c4, $textColor=&quot;red&quot;, $offsetY=&quot;-40&quot;, $offsetX=&quot;10&quot;)

```

## C4 Deployment diagram (C4Deployment)

``` mermaid
    C4Deployment
    title Deployment Diagram for Internet Banking System - Live

    Deployment_Node(mob, &quot;Customer&#39;s mobile device&quot;, &quot;Apple IOS or Android&quot;){
        Container(mobile, &quot;Mobile App&quot;, &quot;Xamarin&quot;, &quot;Provides a limited subset of the Internet Banking functionality to customers via their mobile device.&quot;)
    }

    Deployment_Node(comp, &quot;Customer&#39;s computer&quot;, &quot;Microsoft Windows or Apple macOS&quot;){
        Deployment_Node(browser, &quot;Web Browser&quot;, &quot;Google Chrome, Mozilla Firefox,&lt;br/&gt; Apple Safari or Microsoft Edge&quot;){
            Container(spa, &quot;Single Page Application&quot;, &quot;JavaScript and Angular&quot;, &quot;Provides all of the Internet Banking functionality to customers via their web browser.&quot;)
        }
    }

    Deployment_Node(plc, &quot;Big Bank plc&quot;, &quot;Big Bank plc data center&quot;){
        Deployment_Node(dn, &quot;bigbank-api*** x8&quot;, &quot;Ubuntu 16.04 LTS&quot;){
            Deployment_Node(apache, &quot;Apache Tomcat&quot;, &quot;Apache Tomcat 8.x&quot;){
                Container(api, &quot;API Application&quot;, &quot;Java and Spring MVC&quot;, &quot;Provides Internet Banking functionality via a JSON/HTTPS API.&quot;)
            }
        }
        Deployment_Node(bb2, &quot;bigbank-web*** x4&quot;, &quot;Ubuntu 16.04 LTS&quot;){
            Deployment_Node(apache2, &quot;Apache Tomcat&quot;, &quot;Apache Tomcat 8.x&quot;){
                Container(web, &quot;Web Application&quot;, &quot;Java and Spring MVC&quot;, &quot;Delivers the static content and the Internet Banking single page application.&quot;)
            }
        }
        Deployment_Node(bigbankdb01, &quot;bigbank-db01&quot;, &quot;Ubuntu 16.04 LTS&quot;){
            Deployment_Node(oracle, &quot;Oracle - Primary&quot;, &quot;Oracle 12c&quot;){
                ContainerDb(db, &quot;Database&quot;, &quot;Relational Database Schema&quot;, &quot;Stores user registration information, hashed authentication credentials, access logs, etc.&quot;)
            }
        }
        Deployment_Node(bigbankdb02, &quot;bigbank-db02&quot;, &quot;Ubuntu 16.04 LTS&quot;) {
            Deployment_Node(oracle2, &quot;Oracle - Secondary&quot;, &quot;Oracle 12c&quot;) {
                ContainerDb(db2, &quot;Database&quot;, &quot;Relational Database Schema&quot;, &quot;Stores user registration information, hashed authentication credentials, access logs, etc.&quot;)
            }
        }
    }

    Rel(mobile, api, &quot;Makes API calls to&quot;, &quot;json/HTTPS&quot;)
    Rel(spa, api, &quot;Makes API calls to&quot;, &quot;json/HTTPS&quot;)
    Rel_U(web, spa, &quot;Delivers to the customer&#39;s web browser&quot;)
    Rel(api, db, &quot;Reads from and writes to&quot;, &quot;JDBC&quot;)
    Rel(api, db2, &quot;Reads from and writes to&quot;, &quot;JDBC&quot;)
    Rel_R(db, db2, &quot;Replicates data to&quot;)

    UpdateRelStyle(spa, api, $offsetY=&quot;-40&quot;)
    UpdateRelStyle(web, spa, $offsetY=&quot;-40&quot;)
    UpdateRelStyle(api, db, $offsetY=&quot;-20&quot;, $offsetX=&quot;5&quot;)
    UpdateRelStyle(api, db2, $offsetX=&quot;-40&quot;, $offsetY=&quot;-20&quot;)
    UpdateRelStyle(db, db2, $offsetY=&quot;-10&quot;)

```
