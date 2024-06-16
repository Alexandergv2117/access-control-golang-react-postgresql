package main

import (
	"net/http"

	"github.com/Alexandergv2117/access-control-golang-react-postgresql/routes"
	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/", routes.HomeHandler).Methods("GET")

	http.ListenAndServe(":5000", r)
}
