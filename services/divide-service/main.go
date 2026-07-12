package main

import (
	"fmt"
	"net/http"

	"msce/packages/generated/go/api"

	"github.com/gin-gonic/gin"
)

// curl.exe "http://localhost:8080/divide?a=15&b=3"

func main() {
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
			ctx.JSON(http.StatusBadRequest, api.N400 {
				Message: new("Division by zero ⛔"),
			})
			return
		}

		result := params.A / params.B

		ctx.JSON(http.StatusOK, api.N200{
			Result: &result,
		})
	})
	fmt.Println("Server succesfully run")
	engine.Run(":8080")
}