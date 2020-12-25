// Day 12
// Merry Christmas and a happy new year

// Challenge:
// Santa is looking for a way to distribute the present making to all the elves equally. He has an array of values that looks like this : [1, 2, 2, 3, 1]. 
// Each value in the array represents a present, and the higher the value, the harder the present is to make. 
// You, as Santa's lead programmer, are tasked with writing a program, that, given a number n of elves and an array of present difficulties, must split the array into n smaller arrays which all have the same total sum of values.
// For example : given the array above and n=3, then your program might return:
// [[1, 2], [2, 1], [3]]
// If there is no solution, just return an empty array.

// Language -> Golang

package main
 
import ("fmt")

func main() {
    // Change array here
    var S = []int {1, 2, 2, 3, 1}
    var l = len(S)
    // Change A here
    var n = 3
    partition(S,l,n)
}

func help1(sL []int, k int) bool {
    r := true
    for i := 0; i < k; i++ {
        if(sL[i]!=0){
            r = false
        }
    }
    return r;
}

func help2(S []int, n int, sL []int, A []int, k int) bool {
    if(help1(sL, k)){
        return true
    }
    if(n<0){
        return false
    }
    res := false;
    for i:=0; i<k;i++ {
        if(!res && (sL[i]-S[n])>=0){
            A[n] = i + 1
            sL[i] -= S[n]
            res = help2(S,n-1,sL,A,k)
            sL[i] += S[n]
        }
    }
    return res
}

func partition(S []int, n int, k int) {
    if(n<k){
        return
    }
    sum := arrSum(S)
    A := make([]int, n)
    sL := make([]int, k)
    for i:=0;i<k;i++ {
        sL[i]=sum/k
    }
    res := (sum%k==0) && help2(S,n-1,sL,A,k)
    if(!res){
        fmt.Println("[]")
        return
    }
    fmt.Print("[")
    for i:=0;i<k;i++ {
        fmt.Print("[")
        for j:=0;j<n;j++ {
            if(A[j]==i+1){
                fmt.Printf("%d ",S[j])
            }
        }
        fmt.Print("]")
    }
    fmt.Print("]")
}

func arrSum(array []int) int {  
    result := 0  
    for _, v := range array {  
        result += v  
    }
    return result  
}  
