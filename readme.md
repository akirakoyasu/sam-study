# sam-study

[![Build Status](https://travis-ci.org/akirakoyasu/sam-study.svg?branch=master)](https://travis-ci.org/akirakoyasu/sam-study)

## install deps
```bash
./scripts/install.sh
```

## Invoke on local
```bash
echo '{"message": "Hey, are you there?" }' | ./scripts/sam local invoke "HelloWorldFunction"
```

## deploy
```bash
./scripts/deploy.sh
```

## spec
```bash
./scripts/spec.sh
```