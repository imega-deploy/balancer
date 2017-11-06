TAG=latest
PGROUP=imegadeploy
PNAME=balancer

release: build
	@docker login --username $(DOCKER_USER) --password $(DOCKER_PASS)
	@docker push $(PGROUP)/$(PNAME):$(TAG)

build:
	@docker build -t $(PGROUP)/$(PNAME):$(TAG) .

deploy:
	curl -X POST -H 'TOKEN: $(DEPLOY_TOKEN)' http://d.imega.ru -d '{"namespace":"imega-deploy", "project_name":"$(PNAME)", "tag":"$(TAG)"}'
