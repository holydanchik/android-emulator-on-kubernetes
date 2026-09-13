.PHONY: build deploy delete status port-forward lint

IMAGE ?= ghcr.io/holydanchik/android-emulator-on-kubernetes:latest
NAMESPACE ?= android-emulator

build:
	docker build --tag $(IMAGE) .

deploy:
	kubectl apply -k kubernetes

delete:
	kubectl delete -k kubernetes --ignore-not-found

status:
	kubectl -n $(NAMESPACE) get pods,service

port-forward:
	kubectl -n $(NAMESPACE) port-forward service/android-emulator 4723:4723

lint:
	docker run --rm -i hadolint/hadolint < Dockerfile
