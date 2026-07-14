package main

import (
	"log"
	"github.com/gin-gonic/gin"
	"divide-service/utils"
	"divide-service/handler"
)

// curl.exe "http://localhost:8080/divide?a=15&b=3"

func main() {
	port := utils.Load("PORT")
	
	engine := gin.Default()

	engine.GET("/divide", handler.DivHandler)
	
	if err := engine.Run(":" + port); err != nil {
		log.Fatal("Server failed to start:", err)
	}
}
