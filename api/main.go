package main

import (
	"fmt"
	"net/http"

	"github.com/Alexandergv2117/access-control-golang-react-postgresql/config"
	"github.com/Alexandergv2117/access-control-golang-react-postgresql/db"
	"github.com/Alexandergv2117/access-control-golang-react-postgresql/models"
	"github.com/Alexandergv2117/access-control-golang-react-postgresql/routes"
	"github.com/gorilla/mux"
)

func main() {
	err := config.LoadEnv()
	if err != nil {
		fmt.Println("Error loading environment variables:", err)
		return
	}

	db.DBConnection()

	db.DB.AutoMigrate(models.User{})

	r := mux.NewRouter()

	api := r.PathPrefix("/api").Subrouter()

	api.HandleFunc("/", routes.HomeHandler).Methods("GET")
	api.HandleFunc("/user", routes.GetUsersHandler).Methods("GET")
	api.HandleFunc("/user/{id}", routes.GetUserHandler).Methods("GET")
	api.HandleFunc("/user", routes.CreateUserHandler).Methods("POST")
	api.HandleFunc("/user/{id}", routes.DeleteUserHandler).Methods("DELETE")

	fmt.Println("Server running on port:", config.AppConfig.Port)

	host := fmt.Sprintf(":%d", config.AppConfig.Port)

	http.ListenAndServe(host, r)
}
