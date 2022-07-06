build:
	docker build --rm -t ruby-ubuntu-base .

tag:
	docker tag ruby-ubuntu-base:latest acidtib/ruby-ubuntu-base:latest

push:
	docker push acidtib/ruby-ubuntu-base:latest