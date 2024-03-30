package main

import (
	"log"

	"github.com/goccy/go-json"
	"github.com/gofiber/fiber/v2"
	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	Addr string
	Auth string
}

func main() {
	var config Config = Config{}
	err := envconfig.Process("", &config)
	if err != nil {
		log.Fatal(err.Error())
	}

	app := fiber.New(fiber.Config{
		JSONEncoder: json.Marshal,
		JSONDecoder: json.Unmarshal,
	})

	app.Get("/", func(c *fiber.Ctx) error { return c.SendString("Homepage") })
	app.Get("/info", func(c *fiber.Ctx) error { return c.SendString("Info page") })

	app.Listen(config.Addr)
}
