# library module: http://snelson.org.uk/functions/functional
  
# functional.xq  

A library of useful functionality for working with XQuery 3.0 higher order  functions. Includes a number of functions from the standard Haskell prelude,  as well as functions to perform currying, function composition, and  Y-combination.
   


Author:  John Snelson  
Version:  0.9 

## Table of Contents

* Functions: [ id\#1](#func_ id_1), [ incr\#1](#func_ incr_1), [ flip\#1](#func_ flip_1), [ iterate\#2](#func_ iterate_2), [ repeat\#1](#func_ repeat_1), [ take\#2](#func_ take_2), [ until\#3](#func_ until_3), [ ref\#1](#func_ ref_1), [ deref\#1](#func_ deref_1), [ curry\#1](#func_ curry_1), [ Y\#1](#func_ Y_1), [ compose\#1](#func_ compose_1), [ compose\#2](#func_ compose_2), [ compose\#3](#func_ compose_3), [ compose\#4](#func_ compose_4), [ compose\#5](#func_ compose_5), [ compose\#6](#func_ compose_6), [ compose\#7](#func_ compose_7), [ compose\#8](#func_ compose_8), [ compose\#9](#func_ compose_9), [ compose\#10](#func_ compose_10)


## Functions

### <a name="func_ id_1"/>  id\#1
```xquery
 id($a
)
```
 Returns the argument 


#### Params

* $a


### <a name="func_ incr_1"/>  incr\#1
```xquery
 incr($a
)
```
 Adds one to the argument 


#### Params

* $a


### <a name="func_ flip_1"/>  flip\#1
```xquery
 flip(
  $f as function(item()*,item()*) as item()*
) as  function(item()*,item()*) as item()*
```
 Reverses the order of the arguments in the function passed as an argument 


#### Params

* $f as  function(item()\*,item()\*) as item()\*


#### Returns
*  function(item()\*,item()\*) as item()\*

### <a name="func_ iterate_2"/>  iterate\#2
```xquery
 iterate($f, $a
)
```
  Returns an infinite sequence of ($a, $f($a), $f($f($a)), ...).  Only really useful on an implementation that supports lazy evaluation 


#### Params

* $f

* $a


### <a name="func_ repeat_1"/>  repeat\#1
```xquery
 repeat($a
)
```
  Returns an infinite sequence of the argument sequence repeated.  Only really useful on an implementation that supports lazy evaluation 


#### Params

* $a


### <a name="func_ take_2"/>  take\#2
```xquery
 take($n, $l
)
```
  Returns the first $n items from the sequence $l  


#### Params

* $n: the number of items to return

* $l: the sequence to return items from


### <a name="func_ until_3"/>  until\#3
```xquery
 until($p, $f, $a
)
```
  Tests the predicate $p($a), returning $a if true, or until($p, $f, $f($a)) otherwise.  


#### Params

* $p: the predicate function

* $f: the function to iteratively apply

* $a: the initial starting value


### <a name="func_ ref_1"/>  ref\#1
```xquery
 ref($arg as item()*
) as  function() as item()*
```
 Wrap a sequence as a function item  


#### Params

* $arg as  item()\*


#### Returns
*  function() as item()\*

### <a name="func_ deref_1"/>  deref\#1
```xquery
 deref($arg as function() as item()*
) as  item()*
```
 Unwrap a sequence from a function item 


#### Params

* $arg as  function() as item()\*


#### Returns
*  item()\*

### <a name="func_ curry_1"/>  curry\#1
```xquery
 curry($f as function(*)
) as  function(item()*) as item()*
```
  Curries a function (up to arity 10). Takes a function that accepts  a number of arguments, and returns a function that accepts the first argument,  then returns a new function to accept the second, and so on.  


#### Params

* $f as  function(\*): The function to curry.


#### Returns
*  function(item()\*) as item()\*: The curried version of the function.

#### Errors
 If $f has an arity greater than 10 or less than 1. 

### <a name="func_ Y_1"/>  Y\#1
```xquery
 Y($f as function(*)
) as  function(*)
```
  Y combinator for a function (up to arity 10). Partially applies a function as  the first argument to itself, so that it can call itself recursively using the  value. Returns the partially applied function. ie:   

```xquery
  Y(function($f,$a) { if($a gt 0) then ($a, $f($a - 1)) else $a })(10)  
```
   


#### Params

* $f as  function(\*): The function to partially apply to itself.


#### Returns
*  function(\*): The partially applied function.

#### Errors
 If $f has an arity greater than 10 or less than 1. 

### <a name="func_ compose_1"/>  compose\#1
```xquery
 compose($functions as function(*)+
) as  function(*)
```
  Compose a sequence of functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   

```xquery
  compose((fn:count#1, fn:filter#2))  
```
   


#### Params

* $functions as  function(\*)+: The sequence of functions to compose


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_2"/>  compose\#2
```xquery
 compose($f1 as function(*), $f2 as function(*)
) as  function(*)
```
  Compose two functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   

```xquery
  compose(fn:count#1, fn:filter#2)  
```
   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_3"/>  compose\#3
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*)
) as  function(*)
```
  Compose three functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_4"/>  compose\#4
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*), $f4 as function(*)
) as  function(*)
```
  Compose four functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)

* $f4 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_5"/>  compose\#5
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*), $f4 as function(*), $f5 as function(*)
) as  function(*)
```
  Compose five functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)

* $f4 as  function(\*)

* $f5 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_6"/>  compose\#6
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*), $f4 as function(*), $f5 as function(*),
  $f6 as function(*)
) as  function(*)
```
  Compose six functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)

* $f4 as  function(\*)

* $f5 as  function(\*)

* $f6 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_7"/>  compose\#7
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*), $f4 as function(*), $f5 as function(*),
  $f6 as function(*), $f7 as function(*)
) as  function(*)
```
  Compose seven functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)

* $f4 as  function(\*)

* $f5 as  function(\*)

* $f6 as  function(\*)

* $f7 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_8"/>  compose\#8
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*), $f4 as function(*), $f5 as function(*),
  $f6 as function(*), $f7 as function(*), $f8 as function(*)
) as  function(*)
```
  Compose eight functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)

* $f4 as  function(\*)

* $f5 as  function(\*)

* $f6 as  function(\*)

* $f7 as  function(\*)

* $f8 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_9"/>  compose\#9
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*), $f4 as function(*), $f5 as function(*),
  $f6 as function(*), $f7 as function(*), $f8 as function(*), $f9 as function(*)
) as  function(*)
```
  Compose nine functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)

* $f4 as  function(\*)

* $f5 as  function(\*)

* $f6 as  function(\*)

* $f7 as  function(\*)

* $f8 as  function(\*)

* $f9 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 

### <a name="func_ compose_10"/>  compose\#10
```xquery
 compose($f1 as function(*), $f2 as function(*), $f3 as function(*), $f4 as function(*), $f5 as function(*),
  $f6 as function(*), $f7 as function(*), $f8 as function(*), $f9 as function(*), $f10 as function(*)
) as  function(*)
```
  Compose ten functions into a single function. All the functions   except the last one must have an arity of 1. The last function may accept  between 0 and 10 arguments.   


#### Params

* $f1 as  function(\*)

* $f2 as  function(\*)

* $f3 as  function(\*)

* $f4 as  function(\*)

* $f5 as  function(\*)

* $f6 as  function(\*)

* $f7 as  function(\*)

* $f8 as  function(\*)

* $f9 as  function(\*)

* $f10 as  function(\*)


#### Returns
*  function(\*): The composed function.

#### Errors
 If the last function has an arity greater than 10. 





*Generated by [xquerydoc](https://github.com/xquery/xquerydoc)*
