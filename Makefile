# Declare all phony targets
.PHONY: test producer consumer up down restart all clean logs help db-start db-stop db-reset

# Configuration
NAME_NETWORK_DRIVER := zkit_network
NETWORK_DRIVER := bridge
SERVING_COMPOSE_FILE := docker-compose.serving.yml
DBS_COMPOSE_FILE := docker-compose.dbs.yml

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


### Down Services Commands ##########################################
down-serving:
	docker compose -f $(SERVING_COMPOSE_FILE) down

down-dbs:
	docker compose -f $(DBS_COMPOSE_FILE) down


### Logs Commands ####################################################
logs-dbs:
	docker compose -f $(DBS_COMPOSE_FILE) logs -f

logs-serving:
	docker compose -f $(SERVING_COMPOSE_FILE) logs -f


### Utility Commands #################################################
view-dc-format:
	docker ps --format '{{.ID}} {{.Names}} {{ json .Networks}}'


### Help Commands ###################################################
help:
	@echo "Help commands:"
	@echo "Help commands:"

