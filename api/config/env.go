package config

import (
	"context"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"strconv"

	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/secretsmanager"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/joho/godotenv"
)

type Config struct {
	DBHost     string `json:"host"`
	DBUsername string `json:"username"`
	DBPassword string `json:"password"`
	DBName     string `json:"dbname"`
	DBPort     int    `json:"port"`
	Port       int
}

var AppConfig Config

func SecreteManager(secretName, region string) {
	config, err := config.LoadDefaultConfig(context.TODO(), config.WithRegion(region))
	if err != nil {
		log.Fatal(err)
	}

	svc := secretsmanager.NewFromConfig(config)

	input := &secretsmanager.GetSecretValueInput{
		SecretId:     aws.String(secretName),
		VersionStage: aws.String("AWSCURRENT"),
	}

	result, err := svc.GetSecretValue(context.TODO(), input)
	if err != nil {
		log.Fatal(err.Error())
	}

	var secretString string = *result.SecretString

	var secret Config

	err = json.Unmarshal([]byte(secretString), &secret)
	if err != nil {
		log.Fatal(err)
	}

	AppConfig = Config{
		DBHost:     secret.DBHost,
		DBUsername: secret.DBUsername,
		DBPassword: secret.DBPassword,
		DBName:     secret.DBName,
		DBPort:     secret.DBPort,
	}
}

func loadEnvLocal() {
	dbPortStr := os.Getenv("DB_PORT")
	dbPort, err := strconv.Atoi(dbPortStr)
	if err != nil {
		dbPort = 5432
	}

	AppConfig = Config{
		DBHost:     os.Getenv("DB_HOST"),
		DBUsername: os.Getenv("DB_USERNAME"),
		DBPassword: os.Getenv("DB_PASSWORD"),
		DBName:     os.Getenv("DB_NAME"),
		DBPort:     dbPort,
	}
}

func LoadEnv() error {
	err := godotenv.Load()
	if err != nil {
		fmt.Println("Error loading .env file")
		return err
	}

	if os.Getenv("ENV") == "production" {
		fmt.Println("Loading environment variables from AWS Secrets Manager")
		SecreteManager(os.Getenv("SECRET_NAME"), os.Getenv("REGION"))
	} else {
		fmt.Println("Loading environment variables from .env file")
		loadEnvLocal()
	}

	portStr := os.Getenv("PORT")
	port, err := strconv.Atoi(portStr)
	if err != nil {
		port = 5000
	}

	AppConfig.Port = port

	return nil
}
