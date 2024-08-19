#!/bin/bash

set -e
set -u

go install github.com/google/wire/cmd/wire@latest
go install github.com/go-kratos/kratos/cmd/kratos/v2@latest
kratos upgrade
