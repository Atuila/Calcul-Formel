def pair(n):
    v=[]
    for i in range(3,n):
        if i % 2 == 0:
            v.append(i)
    return v

def tripletPythagoricien(n):
    v=[]
    for x in range(1,n):
        for y in range(1,n):
            for z in range(1,n):
                if x**2 + y ** 2 == z**2:
                    v.append([x,y,z])
    return v

def squareSum(n):
    k=var('k')
    return sum(k^2,k,0,n)

def space2Part(n):
    result = []
    for i in range(1,n+1):
        for j in range(1,i):
            result.append([i,j])
    return result

def spaceN1Part(k,P):
    L=[]
    for i in range(0,len(P)):
        for j in range(1,i):
            K = Set(P[i]).union(Set(P[j]))
            if K.cardinality() == k + 1 and (not K in L):
                L.append(K)
    return L

def spaceNPart(k,n):
    if k == 0:
        return []
    if k == 1:
        return range(1,n)
    L = space2Part(n)
    for i in range(2,k):
        L = spaceN1Part(i,L)
    return L

def Clean(L):
    for i in range(len(L)-1,-1,-1):
        if L[i] == 0:
            del L[i]
        else:
            return L
    return L

def PolyPlus(P,Q):
    Qx.<x>=PolynomialRing(QQ)
    R = []
    Lp = list(P)
    Lq = list(Q)
    if len(Lp) >= len(Lq):
        for i in range(len(Lq)):
            R.append(Lp[i] + Lq[i])
        for i in range(len(Lq), len(Lp)):
            R.append(Lp[i])
    else:
        for i in range(len(Lp)):
            R.append(Lp[i] + Lq[i])
        for i in range(len(Lp), len(Lq)):
            R.append(Lq[i])
    return Qx(R)

def PolyDecale(P,i):
    Qx.<x>=PolynomialRing(QQ)
    Lp = list(P)
    for i in range(i):
        Lp.insert(0,0)
    return Qx(Lp)

def PolyScalaireMult(P,k):
    Qx.<x>=PolynomialRing(QQ)
    Lp = list(P)
    for i in range(len(Lp)):
        Lp[i] = k * Lp[i]
    return Qx(Lp)

def PolyMult(P,Q):
    Qx.<x>=PolynomialRing(QQ)
    R = Qx([])
    B = Q
    for i in range(len(list(P))):
        R = PolyScalaireMult(PolyPlus(R,B),list(P)[i])
        B = PolyDecale(B,1)
    return R

def Divise(P,Q):
    Qx.<x>=PolynomialRing(QQ)
    if Q == 0:
        return
    l = 0
    r = P
    while r!= 0 and Q.degree() <= r.degree():
        t = r.leading_coefficient()/Q.leading_coefficient()
        m = x^r.degree()/x^Q.degree()
        m = Qx(m)
        l = l + t * m
        r = r - (t * m * Q)
    return (l,r)
