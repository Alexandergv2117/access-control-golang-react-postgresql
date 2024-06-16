package routes

import (
	"net/http"

	"github.com/Alexandergv2117/access-control-golang-react-postgresql/config"
)

func HomeHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello World!" + config.GetEnv("DB_USERNAME")))
}
