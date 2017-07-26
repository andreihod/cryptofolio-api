#!/bin/bash
MIX_ENV=prod mix phoenix.digest
MIX_ENV=prod mix do compile, release --env=prod
