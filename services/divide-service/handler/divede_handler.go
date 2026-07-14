package handler

import (
	"divide-service/apperror"
	"errors"
	"msce/packages/generated/go/api"
	"net/http"
	"divide-service/calculation"
	"github.com/gin-gonic/gin"
)

var ErrDivisionByZero = errors.New("Division by zero")

func DivHandler(ctx *gin.Context) {
	// Struct initialazing
	var params api.DivideParams

	// Handle errors and send messages to user
	if err := ctx.ShouldBindQuery(&params); err != nil {
		apperror.HandleBindError(err, ctx)
		return
	}

	// calculate the result
	result, err := calculation.Divede(float32(params.A), float32(params.B))

	if err != nil {
		if errors.Is(err, ErrDivisionByZero) {
			ctx.JSON(http.StatusBadRequest, api.N400{
				Message: new("Division by zero"),
			})
		}
		return
	}

	// send result
	ctx.JSON(http.StatusOK, api.N200{
		Result: &result,
	})
}
