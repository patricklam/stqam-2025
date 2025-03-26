// Paris Metro line 14 (Ada)
// seL4 (Haskell, Isabelle/HOL, C)
// CompCert (Coq)
    // -> "Reflections on Trusting Trust", Ken Thompson
// IronClad (Dafny)

method all_positive() returns (rv:array<int>)
	ensures forall k: int :: 0 <= k < rv.Length ==> rv[k] > 0
{
	var a := new int[2];
	a[0] := 1;
	a[1] := 1;
	return a;
}

method MultipleReturns (x:int, y:int) returns (more:int, less:int)
  requires y > 0
	ensures less < x && x < more
	ensures less < x < more
{
	more := x + y;
	less := x - y;
}

method Max(a:int, b:int) returns (c:int)
	ensures c >= a && c >= b
	ensures c == a || c == b
{
	if a > b {
		return a;
	} else {
		return b;
	}
}

method AbsNegativeValuesOnly(x:int) returns (y:int)
	requires x < 0
	ensures y == x || y == -x
	ensures y >= 0
{
	return -x;
}

method AbsContrived(x:int) returns (y:int)
	requires x == -1
	ensures y == x || y == -x
	ensures y >= 0
{
	y := x + 2;
}

method AbsContrived2(x:int) returns (y:int)
	requires false
	ensures y == x || y == -x
	ensures y >= 0
{
	y := x + 1;
}
	

method TestMax()
{
	var q : int := Max(3, 5);
	assert q == 5;
	var x, y, z: bool := 12, 34, true;
	var r := Abs(-5);
	assert r == 5;
	assert abs(-3) == 3;
}

function abs(x:int) : int
{
	if x < 0 then -x else x
}

method Abs(x:int) returns (y:int)
	ensures y == abs(x)
{
	return abs(x);
}

function fib(n:nat): nat
{
	if n == 0 then 0
	else if n == 1 then 1
	else fib(n-1) + fib(n-2)
}

method ComputeFib(n:nat) returns (b:nat)
	ensures b == fib(n)
{
	if n == 0 { return 0; }
	var i := 1;
	var a := 0;
	b := 1;
	while i < n
		invariant 0 < i <= n
		invariant a == fib(i - 1)
		invariant b == fib(i)
	{
		a, b := b, a + b;
		i := i + 1;
	}
}

method m(n:nat)
{
	var i :int := 0;
	while i != n
		invariant 0 <= i <= n
	{
		i := i + 1;
	}
	assert i == n;
}


// stopped here on Monday
