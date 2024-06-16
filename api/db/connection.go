package db

import (
	"fmt"
	"log"

	"github.com/Alexandergv2117/access-control-golang-react-postgresql/config"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

func DBConnection() {
	DSN := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s",
		config.GetEnv("DB_HOST"),
		config.GetEnv("DB_USERNAME"),
		config.GetEnv("DB_PASSWORD"),
		config.GetEnv("DB_NAME"),
		config.GetEnv("DB_PORT"),
	)

	var error error
	DB, error = gorm.Open(postgres.Open(DSN), &gorm.Config{})

	if error != nil {
		log.Fatal("Error connecting to database")
	} else {
		log.Println("Database connection successful")
	}
}
