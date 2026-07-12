package main

import (
	"fmt"
	"msce/packages/generated/go/api"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

// curl.exe "http://localhost:8080/divide?a=15&b=3"

func main() {
	if err := godotenv.Load(); err != nil {
		fmt.Println("No .env file found, using default port")
	}

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	engine := gin.Default()

	engine.GET("/divide", func(ctx *gin.Context) {
		var params api.DivideParams
		if err := ctx.ShouldBindQuery(&params); err != nil {
			ctx.JSON(http.StatusBadRequest, api.N400{
				Message: new("An error occured here 😢"),
			})
			return
		}

		if params.B == 0 {
			ctx.JSON(http.StatusBadRequest, api.N400{
				Message: new("Division by zero ⛔"),
			})
			return
		}

		result := params.A / params.B

		ctx.JSON(http.StatusOK, api.N200{
			Result: &result,
		})
	})
	fmt.Println("Server running on port:", port)
	engine.Run(":" + port)
}
