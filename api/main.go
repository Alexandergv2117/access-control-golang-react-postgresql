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

	r.HandleFunc("/", routes.HomeHandler).Methods("GET")
	r.HandleFunc("/user", routes.GetUsersHandler).Methods("GET")
	r.HandleFunc("/user/{id}", routes.GetUserHandler).Methods("GET")
	r.HandleFunc("/user", routes.CreateUserHandler).Methods("POST")
	r.HandleFunc("/user/{id}", routes.DeleteUserHandler).Methods("DELETE")

	fmt.Println("Server running on port:", config.AppConfig.Port)

	http.ListenAndServe(":"+config.AppConfig.Port, r)
}
