
# Examples

This page contains a collection of examples of diagrams and charts that
can be created through mermaid and its myriad applications.

**If you wish to learn how to support mermaid on your webpage, read the
[Beginner’s Guide](../config/usage.md?id=usage).**

**If you wish to learn about mermaid’s syntax, Read the [Diagram
Syntax](../syntax/flowchart.md?id=flowcharts-basic-syntax) section.**

## Basic Pie Chart

``` mermaid
pie title NETFLIX
         &quot;Time spent looking for movie&quot; : 90
         &quot;Time spent watching it&quot; : 10
```

``` mermaid
pie title What Voldemort doesn&#39;t have?
         &quot;FRIENDS&quot; : 2
         &quot;FAMILY&quot; : 3
         &quot;NOSE&quot; : 45
```

## Basic sequence diagram

``` mermaid
sequenceDiagram
    Alice -&gt;&gt; Bob: Hello Bob, how are you?
    Bob--&gt;&gt;John: How about you John?
    Bob--x Alice: I am good thanks!
    Bob-x John: I am good thanks!
    Note right of John: Bob thinks a long&lt;br/&gt;long time, so long&lt;br/&gt;that the text does&lt;br/&gt;not fit on a row.

    Bob--&gt;Alice: Checking with John...
    Alice-&gt;John: Yes... John, how are you?
```

## Basic flowchart

``` mermaid
graph LR
    A[Square Rect] -- Link text --&gt; B((Circle))
    A --&gt; C(Round Rect)
    B --&gt; D{Rhombus}
    C --&gt; D
```

## Larger flowchart with some styling

``` mermaid
graph TB
    sq[Square shape] --&gt; ci((Circle shape))

    subgraph A
        od&gt;Odd shape]-- Two line&lt;br/&gt;edge comment --&gt; ro
        di{Diamond with &lt;br/&gt; line break} -.-&gt; ro(Rounded&lt;br&gt;square&lt;br&gt;shape)
        di==&gt;ro2(Rounded square shape)
    end

    %% Notice that no text in shape are added here instead that is appended further down
    e --&gt; od3&gt;Really long text with linebreak&lt;br&gt;in an Odd shape]

    %% Comments after double percent signs
    e((Inner / circle&lt;br&gt;and some odd &lt;br&gt;special characters)) --&gt; f(,.?!+-*ز)

    cyr[Cyrillic]--&gt;cyr2((Circle shape Начало));

     classDef green fill:#9f6,stroke:#333,stroke-width:2px;
     classDef orange fill:#f96,stroke:#333,stroke-width:4px;
     class sq,e green
     class di orange
```

## SequenceDiagram: Loops, alt and opt

``` mermaid
sequenceDiagram
    loop Daily query
        Alice-&gt;&gt;Bob: Hello Bob, how are you?
        alt is sick
            Bob-&gt;&gt;Alice: Not so good :(
        else is well
            Bob-&gt;&gt;Alice: Feeling fresh like a daisy
        end

        opt Extra response
            Bob-&gt;&gt;Alice: Thanks for asking
        end
    end
```

## SequenceDiagram: Message to self in loop

``` mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice-&gt;&gt;John: Hello John, how are you?
    loop Healthcheck
        John-&gt;&gt;John: Fight against hypochondria
    end
    Note right of John: Rational thoughts&lt;br/&gt;prevail...
    John--&gt;&gt;Alice: Great!
    John-&gt;&gt;Bob: How about you?
    Bob--&gt;&gt;John: Jolly good!
```

## Sequence Diagram: Blogging app service communication

``` mermaid
sequenceDiagram
    participant web as Web Browser
    participant blog as Blog Service
    participant account as Account Service
    participant mail as Mail Service
    participant db as Storage

    Note over web,db: The user must be logged in to submit blog posts
    web-&gt;&gt;+account: Logs in using credentials
    account-&gt;&gt;db: Query stored accounts
    db-&gt;&gt;account: Respond with query result

    alt Credentials not found
        account-&gt;&gt;web: Invalid credentials
    else Credentials found
        account-&gt;&gt;-web: Successfully logged in

        Note over web,db: When the user is authenticated, they can now submit new posts
        web-&gt;&gt;+blog: Submit new post
        blog-&gt;&gt;db: Store post data

        par Notifications
            blog--)mail: Send mail to blog subscribers
            blog--)db: Store in-site notifications
        and Response
            blog--&gt;&gt;-web: Successfully posted
        end
    end

```

## A commit flow diagram.

``` mermaid
gitGraph:
    commit &quot;Ashish&quot;
    branch newbranch
    checkout newbranch
    commit id:&quot;1111&quot;
    commit tag:&quot;test&quot;
    checkout main
    commit type: HIGHLIGHT
    commit
    merge newbranch
    commit
    branch b2
    commit
```
