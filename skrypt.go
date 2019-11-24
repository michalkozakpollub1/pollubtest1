package main

import (
  "fmt"
  "net/http"
)

const (
  port = ":80"
)

const N = 100

func sieveOfEratosthenes(N int) (primes []int) {
    b := make([]bool, N)
    for i := 2; i < N; i++ {
        if b[i] == true { continue }
        primes = append(primes, i)
        for k := i * i; k < N; k += i {
            b[k] = true
        }
    }
    return
}
var primes = sieveOfEratosthenes(N)
func WyswietlLiczby(w http.ResponseWriter, r *http.Request) {

	for i := 1; i < len(primes)+1; i++ {
        fmt.Fprintf(w, "Liczba nr.%d = %d", i, primes[i-1])
	fmt.Fprintf(w,"\n")
    }
}

func init() {
  fmt.Printf("Started server at http://localhost%v.\n", port)
  http.HandleFunc("/", WyswietlLiczby)
  http.ListenAndServe(port, nil)
}

func main() {}

