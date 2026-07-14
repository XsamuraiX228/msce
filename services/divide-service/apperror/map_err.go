package apperror

import (
	"errors"
	"msce/packages/generated/go/api"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
)

func HandleBindError(err error, ctx *gin.Context) {
	var numErr *strconv.NumError
	var validationErr validator.ValidationErrors

	switch {
	case errors.As(err, &numErr):
		ctx.JSON(http.StatusBadRequest, api.N400{
			Message: new("parameter must be a valid number"),
		})
	case errors.As(err, &validationErr):
		field := validationErr[0].Field()
		ctx.JSON(http.StatusBadRequest, api.N400{
			Message: new("Missing parameter: " + field),
		})
	default:
		ctx.JSON(http.StatusBadRequest, api.N400{
			Message: new("Unknow error"),
		})
	}
}
