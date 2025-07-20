# Declare all phony targets
.PHONY: test producer consumer up down restart all clean logs help db-start db-stop db-reset

# Configuration
NAME_NETWORK_DRIVER := zkit_network
NETWORK_DRIVER := bridge
SERVING_COMPOSE_FILE := docker-compose.serving.yml
DBS_COMPOSE_FILE := docker-compose.dbs.yml
ORCHESTRATION_COMPOSE_FILE := ./orchestration/docker-compose.orchestration.yaml
OBSERVABILITY_COMPOSE_FILE := ./observability/docker-compose.observability.yaml
TOOL_COMPOSE_FILE := docker-compose.tools.yml

# Network
up-network:
	docker network create --driver $(NETWORK_DRIVER) $(NAME_NETWORK_DRIVER)

down-network:
	docker network rm $(NAME_NETWORK_DRIVER)


### Up Sevices Commands ############################################
up-serving:
	docker compose -f $(SERVING_COMPOSE_FILE) up -d --build

up-dbs:
	docker compose -f $(DBS_COMPOSE_FILE) up -d --build

up-tools:
	docker compose -f $(TOOL_COMPOSE_FILE) up -d --build

up-orchestration:
	docker compose -f $(ORCHESTRATION_COMPOSE_FILE) up -d --build

up-observability:
	docker compose -f $(OBSERVABILITY_COMPOSE_FILE) up -d --build


### Down Services Commands ##########################################
down-serving:
	docker compose -f $(SERVING_COMPOSE_FILE) down

down-dbs:
	docker compose -f $(DBS_COMPOSE_FILE) down -v

down-tools:
	docker compose -f $(TOOL_COMPOSE_FILE) down -v

down-orchestration:
	docker compose -f $(ORCHESTRATION_COMPOSE_FILE) down -v

down-observability:
	docker compose -f $(OBSERVABILITY_COMPOSE_FILE) down -v


### Logs Commands ####################################################
log-dbs:
	docker compose -f $(DBS_COMPOSE_FILE) logs -f

log-serving:
	docker compose -f $(SERVING_COMPOSE_FILE) logs -f

log-tools:
	docker compose -f $(TOOL_COMPOSE_FILE) logs -f

log-orchestration:
	docker compose -f $(ORCHESTRATION_COMPOSE_FILE) logs -f

log-observability:
	docker compose -f $(OBSERVABILITY_COMPOSE_FILE) logs -f


### Start Services Commands #########################################
start-serving:
	docker compose -f $(SERVING_COMPOSE_FILE) restart

start-dbs:
	docker compose -f $(DBS_COMPOSE_FILE) restart

start-tools:
	docker compose -f $(TOOL_COMPOSE_FILE) restart

start-orchestration:
	docker compose -f $(ORCHESTRATION_COMPOSE_FILE) restart

start-observability:
	docker compose -f $(OBSERVABILITY_COMPOSE_FILE) restart


### Start Services Commands #########################################
stop-serving:
	docker compose -f $(SERVING_COMPOSE_FILE) stop

stop-dbs:
	docker compose -f $(DBS_COMPOSE_FILE) stop

stop-tools:
	docker compose -f $(TOOL_COMPOSE_FILE) stop

stop-orchestration:
	docker compose -f $(ORCHESTRATION_COMPOSE_FILE) stop

stop-observability:
	docker compose -f $(OBSERVABILITY_COMPOSE_FILE) stop


### Down and Up Services Commands ####################################
restart-serving: down-serving up-serving
restart-dbs: down-dbs up-dbs
restart-tools: down-tools up-tools
restart-orchestration: down-orchestration up-orchestration
restart-observability: down-observability up-observability


### Clean everything #################################################
clean:
	docker compose -f $(SERVING_COMPOSE_FILE) down
	docker compose -f $(DBS_COMPOSE_FILE) down -v
	docker compose -f $(TOOL_COMPOSE_FILE) down -v
	docker compose -f $(ORCHESTRATION_COMPOSE_FILE) down -v
	docker compose -f $(OBSERVABILITY_COMPOSE_FILE) down -v
###	docker system prune -f

### Utility Commands #################################################
up-all: up-dbs up-serving up-tools up-orchestration up-observability
stop-all: stop-dbs stop-serving stop-tools stop-orchestration stop-observability
view-dc-format:
	docker ps --format '{{.ID}} {{.Names}} {{ json .Networks}}'


### Help Commands ###################################################
help:
	@echo "Commands:"
	@echo "make up-<service>            - Start all services"
	@echo "make down-<service>          - Stop all services"
	@echo "make retart-<service>        - Restart all services"
	@echo "make stop-<service>          - Stop all services"
	@echo "make start-<service>         - Start all services"
	@echo "make clean                   - Remove all containers and everything"
	@echo "make log-<service>          - Show logs for spectific service"
	@echo "make view-<service>          - View spectific service"
