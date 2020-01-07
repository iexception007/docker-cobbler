REPO=iexception007/cobbler:v1.0

.PHONE: build release run clean
build:
	docker build -t ${REPO} .

release:
	docker push ${REPO}

run:
	docker-compose up -d

clean:
	docker-compose down
