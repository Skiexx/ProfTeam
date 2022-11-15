# Prof Team
Environment with PHP, NGINX, PostgreSQL, Adminer
## Launch prod build
1. Clone this repo
```bash
git clone https://github.com/Skiexx/ProfTeam.git
```
2. Go to the project folder
```bash
cd ProfTeam
```
3. Create .env file by example
```bash
cp .env.example .env
```
4. Edit .env file
```bash
nano .env
```
5. Run docker-compose
```bash
docker-compose -f docker-compose.prod.yml up -d
```
## Launch dev build
1. Clone this repo
```bash
git clone https://github.com/Skiexx/ProfTeam.git
```
2. Go to the project folder
```bash
cd ProfTeam
```
3. Create .env file by example
```bash
cp .env.example .env
```
4. Edit .env file
```bash
nano .env
```
5. Run docker-compose for dev build
```bash
docker-compose up -d --build
```
### Aditional you can edit hosts file for your OS to redirect *profteam.ru* to *localhost*  
For Linux:
```
sudo nano /etc/hosts
```
add line to the end: `127.0.0.1 dev.profteam.ru`
