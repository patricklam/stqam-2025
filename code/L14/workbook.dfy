method all_positive() returns (rv:array<int>)
	ensures forall k: int :: 0 <= k < rv.Length ==> 0 < rv[k]
{
	var arr := new int[2];
	arr[0] := 2;
	arr[1] := -3;
	return arr;
}

method Abs(x:int) returns (y:int) {
	if x < 0 {
		return -x;
	} else {
  	return x;
	}
}

method MultipleReturns(x:int, y:int) returns (more:int, less:int)
    ensures less < x
    ensures x < more
{
	more := x + y;
	less := x - y;
}

method AbsWithPostcondition(x:int) returns (y:int)
	ensures 0 < y
{
	if x < 0 {
		return -x;
	} else {
  	return x;
	}
}

method Max(a: int, b: int) returns (c: int)
	ensures c >= a && c >= b
{
	if a > b {
		return a;
	} else {
		return b;
	}
}

method m()
{
  var x, y, z: bool := 1, 2, true;
}

method TestAbsWithPostcondition(){
	var v := AbsWithPostcondition(3);
	assert 0 <= v;
}

method TestMax() {
	// ...
}

method TestAbs()
{
  var v := AbsWithPostcondition(3);
  assert 0 <= v;
  assert v == 3;
}

method NotAbs(x:int) returns (y:int)
ensures 0 <= y
{
  return 5;
}

method TestNotAbs(x:int) returns (y:int)
ensures 0 <= y
{
  var v := NotAbs(3);
  assert v == 3; // actually not true
}

method AbsBetterPostcondition(x:int) returns (y:int)
ensures 0 <= y
ensures 0 <= x ==> y == x
{
  if x < 0 {
    return -x;
  } else {
    return x;
  }
}

method TestAbsBetter(x:int) returns (y:int)
{
	var v := AbsBetterPostcondition(5);
	assert v == 5;
	var w := AbsBetterPostcondition(-2);
	assert w == 2;
}

method AbsFullPostcondition(x:int) returns (y:int)
ensures 0 <= y
ensures 0 <= x ==> y == x
ensures x < 0 ==> y == -x
{
  if x < 0 {
    return -x;
  } else {
    return x;
  }
}

method AbsAnotherPostcondition(x:int) returns (y:int)
	ensures 0 <= y && (y == x || y == -x)
{
  if x < 0 {
    return -x;
  } else {
    return x;
  }
}

method AbsOnlyNegative(x:int) returns (y:int)
	requires x < 0
	ensures y == -x
{
	return -x;
}
	
method AbsContrivedPreconditionOne(x:int) returns (y:int)
	// add a precondition so that the method verifies
	ensures 0 <= y
	ensures 0 <= x ==> y == x
	ensures x < 0 ==> y == -x
{
	y := x + 2;
}

method AbsContrivedPreconditionTwo(x:int) returns (y:int)
	requires false
	ensures 0 <= y
	ensures 0 <= x ==> y == x
	ensures x < 0 ==> y == -x
{
	y := x + 1;
}

function abs(x:int) : int
{
  if x < 0 then -x else x
}

method m2()
{
  assert abs(3) == 3;
}

function max(x:int, y:int) : int
{
	if x > y then x else y
}

method testMax()
{
	assert max(3, 5) == 5;
}

method AbsWithFunction(x:int) returns (y:int)
	ensures y==abs(x)
{
	return abs(x);
}  

method ComputeFib(n: nat) returns (b: nat)
//  ensures b == fib(n)
{
  // ...
}

method FirstLoop(n:nat) 
{
  var i := 0;
  while i < n
		invariant 0 <= i < n
  {
    i := i + 1;
  }
  assert i == n;
}
