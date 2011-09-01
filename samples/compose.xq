xquery version "3.0";

(:
 : Copyright (c) 2010-2011 John Snelson
 :
 : Licensed under the Apache License, Version 2.0 (the "License");
 : you may not use this file except in compliance with the License.
 : You may obtain a copy of the License at
 :
 :     http://www.apache.org/licenses/LICENSE-2.0
 :
 : Unless required by applicable law or agreed to in writing, software
 : distributed under the License is distributed on an "AS IS" BASIS,
 : WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 : See the License for the specific language governing permissions and
 : limitations under the License.
 :)

import module namespace func = "http://snelson.org.uk/functions/functional" at "functional.xq";

let $compose1 := func:compose((function($a) { $a + 1 }, round#1, number#1, concat#2))
let $compose2 := func:compose(function($a) { $a + 1 }, round#1, number#1, concat#2)
return (
  $compose1("5", ".5"),
  $compose2("3", ".4")
)
