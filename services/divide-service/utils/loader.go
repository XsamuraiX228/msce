package utils

import (
	"log"
	"os"
	"github.com/joho/godotenv"
)

func Load(PORT string) string {
	if err := godotenv.Load(); err != nil {
		log.Fatal("Environment file is not found")
	}
	
	port := os.Getenv(PORT)
	
	if port == "" {
		log.Fatal("Port is empty")
	}
	
	return port
}