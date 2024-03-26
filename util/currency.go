package util

const (
	USD = "USD"
	EUR = "EUR"
	CAD = "CAD"
)

// Returns true if the input currency is supported
func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, CAD:
		return true
	}
	return false
}
