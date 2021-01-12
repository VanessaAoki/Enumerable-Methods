### my_each
Iterates the given block for each element with an arbitrary object given, and returns the initially given object.

If no block is given, returns an enumerator.

### my_each_with_index
Calls block with two arguments, the item and its index, for each item in enum. Given arguments are passed through to each().

If no block is given, an enumerator is returned instead.

### my_select
Returns an array containing all elements of enum for which the given block returns a true value.

If no block is given, an Enumerator is returned instead.

### my_all?
Passes each element of the collection to the given block. The method returns true if the block never returns false or nil. If the block is not given, Ruby adds an implicit block of { |obj| obj } which will cause all? to return true when none of the collection members are false or nil.

If instead a pattern is supplied, the method returns whether pattern === element for every collection member.

### my_any?
Passes each element of the collection to the given block. The method returns true if the block ever returns a value other than false or nil. If the block is not given, Ruby adds an implicit block of { |obj| obj } that will cause any? to return true if at least one of the collection members is not false or nil.

If instead a pattern is supplied, the method returns whether pattern === element for any collection member.

### my_none?
Passes each element of the collection to the given block. The method returns true if the block never returns true for all elements. If the block is not given, none? will return true only if none of the collection members is true.

If instead a pattern is supplied, the method returns whether pattern === element for none of the collection members.

### my_count
Returns the number of items in enum through enumeration. If an argument is given, the number of items in enum that are equal to item are counted. If a block is given, it counts the number of elements yielding a true value.

### my_map
Returns a new array with the results of running block once for every element in enum.

If no block is given, an enumerator is returned instead.

### my_inject
Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.

The inject and reduce methods are aliases. There is no performance benefit to either.

If you specify a block, then for each element in enum the block is passed an accumulator value (memo) and the element. If you specify a symbol instead, then each element in the collection will be passed to the named method of memo. In either case, the result becomes the new value for memo. At the end of the iteration, the final value of memo is the return value for the method.

If you do not explicitly specify an initial value for memo, then the first element of collection is used as the initial value of memo.