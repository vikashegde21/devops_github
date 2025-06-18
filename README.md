# DevOps Demo Web Application

A Node.js web application with integrated monitoring and CI/CD pipeline using Docker, Docker Compose, Prometheus, Grafana, and GitHub Actions.

## Features
- Node.js Express API with health checks and metrics
- Dockerized for easy deployment
- Nginx reverse proxy (optional)
- Prometheus, Grafana, Node Exporter, cAdvisor, and Alertmanager for monitoring
- Automated CI/CD with GitHub Actions
- Security audit and best practices

## Project Structure
```
├── app/                  # Node.js application
│   ├── public/           # Static files
│   ├── routes/           # API routes
│   ├── server.js         # Main server file
│   └── package.json      # App dependencies
├── monitoring/           # Monitoring stack
│   ├── prometheus.yml    # Prometheus config
│   ├── alertmanager.yml  # Alertmanager config
│   ├── grafana/          # Grafana dashboards
│   └── docker-compose.monitoring.yml # Monitoring compose file
├── scripts/              # Build, deploy, health-check scripts
├── Dockerfile            # Multi-stage Docker build
├── docker-compose.yml    # Main app compose file
└── .github/workflows/ci-cd.yml # GitHub Actions workflow
```

## Getting Started

### Prerequisites
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)
- [Node.js 18+](https://nodejs.org/)

### Local Development
1. Install dependencies:
   ```sh
   cd app
   npm install
   ```
2. Start the app:
   ```sh
   npm start
   ```
3. App runs at [http://localhost:3000](http://localhost:3000)

### Run with Docker Compose
1. Build and start the app:
   ```sh
   docker-compose up --build -d
   ```
2. (Optional) Start monitoring stack:
   ```sh
   docker-compose -f monitoring/docker-compose.monitoring.yml up -d
   ```
3. Access:
   - App: [http://localhost:3000](http://localhost:3000)
   - Prometheus: [http://localhost:9090](http://localhost:9090)
   - Grafana: [http://localhost:3001](http://localhost:3001) (admin/admin123)
   - Node Exporter: [http://localhost:9100/metrics](http://localhost:9100/metrics)
   - cAdvisor: [http://localhost:8080](http://localhost:8080)
   - Alertmanager: [http://localhost:9093](http://localhost:9093)

### CI/CD Pipeline
- Automated with GitHub Actions: runs tests, builds Docker images, and can push to GitHub Container Registry.
- See `.github/workflows/ci-cd.yml` for details.

### Deploying to AWS EC2 with GitHub Actions
1. Launch an EC2 instance (Ubuntu recommended) and open ports 22, 3000, 9090, 3001, 9100, 8080, 9093.
2. SSH into your instance and install Docker & Docker Compose.
3. Clone your repo to `/home/ubuntu/devops_github`.
4. Generate an SSH key pair on EC2:
   ```sh
   ssh-keygen -t ed25519 -C "github-actions"
   cat ~/.ssh/id_ed25519
   # Copy the private key and add it as the EC2_SSH_KEY secret in your GitHub repo
   cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
   chmod 600 ~/.ssh/authorized_keys
   ```
5. Add your EC2 public IP as the `EC2_HOST` secret in your GitHub repo.
6. The GitHub Actions workflow will SSH into your EC2 and deploy automatically after each push to main/master.

## Security & Best Practices
- Uses non-root Docker user
- Health checks and metrics endpoints
- Security audit in CI pipeline

## License
MIT

---

> DevOps demo by Vikas Hegde. Contributions welcome!
