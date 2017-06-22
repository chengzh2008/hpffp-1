# Chapter 1 - Anything from Almost Nothing (The Lambda Calculus)

## Beta reduce the following:

1. `(λabc.cba)zz(λwv.w)`
```
(λa.λb.λc.cba)(z)z(λw.λv.w)
(λb.λc.cbz)(z)(λw.λv.w)
(λc.czz)(λw.λv.w)
(λw.λv.w)(z)z
(λv.z)(z)
z
```
2. `(λx.λy.xyy)(λa.a)b`
```
(λy.(λa.a)yy)b
(λa.a)bb
bb
```
3. `(λy.y)(λx.xx)(λz.zq)`
```
(λx.xx)(λz.zq)
(λz.zq)(λz.zq)
(λz.zq)q
qq
```
4. `(λz.z)(λz.zz)(λz.zy)`
```
(λz.zz)(λz.zy)
(λz.zy)(λz.zy)
(λz.zy)y
yy
```
5. `(λx.λy.xyy)(λy.y)y`
```
(λy.(λy.y)yy)y
(λy.λy)yy
yy
```
6. `(λa.aa)(λb.ba)c`
```
(λb.ba)(λb.ba)c
(λb.ba)ac
aac
```
7. `(λxyz.xz(yz))(λx.z)(λx.a)`
```
(λx.λy.λz.(xz(yz)))(λx.z)(λx.a)
(λy.λz1.(λx.z)z1(yz1))(λx.a)
(λz1.(λx.z)(z1)(λx.a)(z1))
(λz1.z(λx.a)(z1))
(λz1.za)
```
