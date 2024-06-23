package api

import (
	"fmt"
	"net/http"

	"github.com/Alexandergv2117/access-control-golang-react-postgresql/routes"
	"github.com/gorilla/mux"
)

func RunApi(port int) {
	r := mux.NewRouter()

	api := r.PathPrefix("/api").Subrouter()

	api.HandleFunc("/", routes.HomeHandler).Methods("GET")
	api.HandleFunc("/user", routes.GetUsersHandler).Methods("GET")
	api.HandleFunc("/user/{id}", routes.GetUserHandler).Methods("GET")
	api.HandleFunc("/user", routes.CreateUserHandler).Methods("POST")
	api.HandleFunc("/user/{id}", routes.DeleteUserHandler).Methods("DELETE")

	fmt.Println("Server running on port:", port)

	host := fmt.Sprintf(":%d", port)

	http.ListenAndServe(host, r)
}
