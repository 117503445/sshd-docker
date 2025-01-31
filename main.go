package main

import (
	"os"
	"os/exec"

	"github.com/117503445/goutils"
	"github.com/rs/zerolog/log"
)

func main() {
	goutils.InitZeroLog()

	password := os.Getenv("PASSWORD")
	if password != "" {
		log.Info().Str("password", password).Msg("")
		cmd := exec.Command("sh", "-c", "echo -e '"+password+"\n"+password+"' | passwd root")
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stdout
		err := cmd.Run()
		if err != nil {
			log.Fatal().Err(err).Msg("Failed to execute command")
		}
	}

	// call rclone
	cmd := exec.Command("/usr/sbin/sshd", "-D", "-e")
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stdout
	err := cmd.Run()
	if err != nil {
		log.Fatal().Err(err).Msg("Failed to execute command")
	}
}
