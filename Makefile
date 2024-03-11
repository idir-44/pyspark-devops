start:
	docker compose up -d --build

stop:
	docker compose down

delete:
	docker compose kill
	docker compose rm -v --force