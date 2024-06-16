package config

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	DBHost     string
	DBUsername string
	DBPassword string
	DBName     string
	DBPort     string
	Port       string
}

var AppConfig Config

func LoadEnv() error {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("Error loading .env file")
		return err
	}

	AppConfig = Config{
		DBHost:     os.Getenv("DB_HOST"),
		DBUsername: os.Getenv("DB_USERNAME"),
		DBPassword: os.Getenv("DB_PASSWORD"),
		DBName:     os.Getenv("DB_NAME"),
		DBPort:     os.Getenv("DB_PORT"),
		Port:       os.Getenv("PORT"),
	}

	return nil
}

func GetEnv(key string) string {
	switch key {
	case "DB_HOST":
		return AppConfig.DBHost
	case "DB_USERNAME":
		return AppConfig.DBUsername
	case "DB_PASSWORD":
		return AppConfig.DBPassword
	case "DB_NAME":
		return AppConfig.DBName
	case "DB_PORT":
		return AppConfig.DBPort
	case "PORT":
		return AppConfig.Port
	default:
		return ""
	}
}
