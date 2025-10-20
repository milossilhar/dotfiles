POSTGRES := './compose.yaml'
POSTGRES_ENV := './env'

list:
  PGPASSWORD=$(grep POSTGRES_PASSWORD {{POSTGRES_ENV}} | cut -d '=' -f2) psql -l -h localhost -p 5432 -U postgres

connect db:
  PGPASSWORD=$(grep POSTGRES_PASSWORD {{POSTGRES_ENV}} | cut -d '=' -f2) psql -d {{db}} -h localhost -p 5432 -U postgres

start:
  docker compose -f {{POSTGRES}} up -d

stop:
  docker compose -f {{POSTGRES}} down

remove:
  ../yesno.sh && docker compose -f {{POSTGRES}} down -v || echo