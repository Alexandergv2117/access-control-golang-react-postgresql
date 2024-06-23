package main

import (
	"fmt"

	"github.com/Alexandergv2117/access-control-golang-react-postgresql/cmd/api"
	"github.com/Alexandergv2117/access-control-golang-react-postgresql/config"
	"github.com/Alexandergv2117/access-control-golang-react-postgresql/db"
	"github.com/Alexandergv2117/access-control-golang-react-postgresql/models"
)

func main() {
	err := config.LoadEnv()
	if err != nil {
		fmt.Println("Error loading environment variables:", err)
		return
	}

	db.DBConnection()

	db.DB.AutoMigrate(models.User{})

	api.RunApi(config.AppConfig.Port)
}
