package main
import("encoding/json";"log";"net/http")
func main(){m:=http.NewServeMux();m.HandleFunc("/health",func(w http.ResponseWriter,r *http.Request){w.Header().Set("Content-Type","application/json");json.NewEncoder(w).Encode(map[string]string{"service":"learning-lab-tooling","status":"ok"})});m.HandleFunc("/runtime/status",func(w http.ResponseWriter,r *http.Request){json.NewEncoder(w).Encode(map[string]string{"dart":"pinned runtime","flutter":"pinned engine","abi":"armeabi-v7a"})});log.Fatal(http.ListenAndServe("127.0.0.1:8787",m))}
