#!/bin/bash

go get github.com/google/wire/cmd/wire@latest
go install github.com/go-kratos/kratos/cmd/kratos/v2@latest
kratos upgrade
