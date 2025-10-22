# `ERPNext` **Docker** container

This is a simplified version of the official `ERPNext` **Docker** container deployment. I experienced a hard time deploying the application with the originally documented procedure, so decided to create this one.

## Instruction
- Clone the repository to your **project path**
- Ensure your current directory is the project path
- Make necessary changes to the `.env` file
- No need to touch the `docker-compose.yml` file

## **First time** execution (or `reset` an existing instance)
- Run using the `Reset.sh` bash script: `bash Reset.sh`

## **Regular** execution
- Run using the `Start.sh` bash script: `bash Start.sh`

## Official `ERPNext` **Docker** repository
- `https://github.com/frappe/frappe_docker`