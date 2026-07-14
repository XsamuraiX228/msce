package calculation

import (
	"errors"
)

var ErrDivisionByZero = errors.New("Division by zero")

func Divede(a, b float32) (float32, error) {
	if b == 0 {
		return 0, ErrDivisionByZero
	}

	return a / b, nil
}