# `ERPNext` **Docker** container
This is a simplified version of the official `ERPNext` **Docker** container deployment. I experienced a hard time deploying the application with the originally documented procedure, so decided to create this one.

## Instruction
- Clone the repository to your **project path**
- Ensure your current directory is the **project path**
- Make necessary changes to the `.env` file
	- Check the `DOCKER_NETWORK_PREFIX` **environment variable** to ensure the **Docker network subnet** does not conflict with any existing **Docker network**
	- Change the `HOST_NAME` **environment variable** to the **domain**/**subdomain** you will be using to access this `ERPNext` **Docker** instance with
- No need to touch the `docker-compose.yml` file

## **First time** execution (or `reset` an existing instance)
- Run using the `Reset.sh` bash script: `bash Reset.sh`

## **Regular** execution
- Run using the `Start.sh` bash script: `bash Start.sh`

## How to access this `ERPNext` **Docker** instance?
- Access `ERPNext` from within the private **Docker network**
- Default username is `Administrator` and password is `admin`
- Set `ERPNEXT_IP` **environment** variable in `.env` file to `0.0.0.0` to access it from anywhere (**not recommended** for **internet** exposure)

## SSL: Secure HTTP access
The default deployment comes with **non SSL** flavor within a private **Docker network**, to be used with an **HTTP reverse proxy** for access from the **internet**. There are two ways to expose this `ERPNext` **Docker** instance to the **internet** for **public** access;

1. **Built in** `Let's Encrypt` certificate: Tweak with the `.env` file and figure it out on your own!
2. The **easiest** is to use the magical [`NginX Proxy Manager`](https://nginxproxymanager.com/) **Docker** instance :) Deploy `NginX Proxy Manager` and simply forward all HTTP requests to this private `ERPNext` instance.

## **SSO** integration: `Keycloak`
- Navigate to `Left panel / Integations / Authentication / Social Login Key`
- Activate the `Enable Social Login` **checkbox**
- Click `Add Social Login Key` button on top right
- Select `Keycloak` from the **Social Login Provider** list
- Input `Client ID` and `Client Secret` values from **Keycloak**
- Set **Base URL** to `https://keycloak.domain.tld/realms/REALM_NAME`
- Set **Configuration / Sign ups** to `Allow` mode
- Click the `Save` button on top right
- You must setup `HTTP` only **Redirect URL** too in **Keycloak** if running **ERPNext** behind a reverse proxy; because, seemingly, **ERPNext** sends `http` URL as redirection to **Keycloak**, *by mistake or not*.
- ### Customize the **SSO** button;
	- Create the **Keycloak SSO** profile as described above but keep it disabled (this is **important**)
	- Creatte a new **SSO** profile
	- Select `Custom` from the **Social Login Provider** list
	- Give a desired name to your button: `My ID Provider`
	- Put in `Client ID` and `Client Secret` from **Keycloak**
	- Copy `Base URL` from the **Keycloak** profile created earlier
	- Set **Configuration / Sign ups** to `Allow` mode
	- Copy `Authorize URL`, `Redirect URL`, `Access Token URL`, `API Endpoint URL` and `Auth URL Data` values from the **Keycloak** profile created earlier
	- **Activate** the profile and **save** it


## How to **backup** & **restore**?
Simpler than ever;
- Stop this `ERPNext` **Docker** instance: `docker compose down`
- **Backup**: Copy the entire **project directory**
- **Restore**: Execute from the new location, **no data lost**

## Where is the **Volume** data kept?
All **Volume** data are kept locally in `Volume` folder within the **project path** under seperate folders;
- ERPNext
- MySQL
- Redis

## Official `ERPNext` **Docker** repository
- [`ERPNext Docker`](https://github.com/frappe/frappe_docker)