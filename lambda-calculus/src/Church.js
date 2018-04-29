// https://en.wikipedia.org/wiki/Church_encoding

const zero = _ => x => x;
const one = f => x => f(x);
const two = f => x => f(f(x));
const inc = n => f => x => f(n(f)(x));
const unchurch = n => n(x => x + 1)(0);
const church = n => f => x => {
  if (n === 0) {
    return x;
  }
  return f(church(n - 1)(f)(x));
};

console.log(unchurch(zero)); // 0
console.log(unchurch(one)); // 1
console.log(unchurch(two)); // 2
console.log(unchurch(inc(two))); // 3
console.log(unchurch(inc(inc(two)))); // 4
console.log(unchurch(church(50))); // 50
console.log(unchurch(inc(inc(inc(church(50)))))); // 53
