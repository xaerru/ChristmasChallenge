//Language - Golang

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
