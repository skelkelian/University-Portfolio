?nottem
class(nottem)
plot(nottem)
decompose(nottem)
plot(decompose(nottem))
nottem.vec <- as.vector(nottem)
nottem.vec
plot(decompose(nottem.vec))
nottem.ts <- ts(nottem.vec, frequency = 12)
plot(decompose(nottem.ts))
nottem.ts <- ts(nottem.vec, frequency = 7)
plot(decompose(nottem.ts)) # decomposition with wrong frequency
acf(nottem.vec)
nottem.ts <- ts(nottem.vec, frequency = 12)
plot(decompose(nottem.ts))
