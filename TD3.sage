Qx.<x>=PolynomialRing(QQ)

def Karatsuba(P,Q,n) :
    if n==1 :
         return [P[0]*Q[0],0]
    m=n//2
    l=2*n
    P1=[P[i] for i in range(m,n)]
    P2=[P[i] for i in range(n)]
    Q1=[Q[i] for i in range(m,n)]
    Q2=[Q[i] for i in range(n)]
    S1=[P1[i]+P2[i] for i in range(0,m)]
    S2=[Q1[i]+Q2[i] for i in range(0,m)]
    R1=Karatsuba(P1,Q1,m)
    R2=Karatsuba(S1,S2,m)
    R3=Karatsuba(P2,Q2,m)
    R=[0 for i in range(0,l)]
    for i in range(0,n) :
        R[i]=R3[i]
    for i in range(m,m+n) :
        R[i]=R[i]+R2[i-m]-R1[i-m]-R3[i-m]
    for i in range(n,2*n) :
        R[i]=R[i]+R1[i-n]
    return R


'''La fonction suivante teste Karatsuba sur des exemples
(n est une puissance de 2).'''

def TestKaratsuba(n):
    ZX.<x>=PolynomialRing(ZZ)
    P=ZX.random_element(n-1)
    Q=ZX.random_element(n-1)
    print(P)
    print(Q)
    R=ZX(Karatsuba(P,Q,n))
    print(R)
    S=P*Q
    print(S)
    return R-S
