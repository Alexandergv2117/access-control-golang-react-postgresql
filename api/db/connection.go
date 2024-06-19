package db

import (
	"fmt"
	"log"
	"strconv"

	"github.com/Alexandergv2117/access-control-golang-react-postgresql/config"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DB *gorm.DB

func DBConnection() {
	DSN := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s",
		config.AppConfig.DBHost,
		config.AppConfig.DBUsername,
		config.AppConfig.DBPassword,
		config.AppConfig.DBName,
		strconv.Itoa(config.AppConfig.DBPort),
	)

	var error error
	DB, error = gorm.Open(postgres.Open(DSN), &gorm.Config{})

	if error != nil {
		log.Fatal("Error connecting to database")
	} else {
		log.Println("Database connection successful")
	}
}
