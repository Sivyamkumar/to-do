# 📝 Todo Application – CI/CD with Jenkins & Docker

This repository contains a Node.js + Express Todo application that is automatically built, containerized, and deployed using Jenkins, Docker, and GitHub Webhooks.

Every time code is pushed to GitHub, Jenkins triggers a pipeline that:

- Pulls the latest code
- Builds a Docker image
- Runs MongoDB in a container
- Deploys the Todo application container
- Makes the application live on an EC2 instance

---

## 🚀 What This Project Does

- Provides a Todo application with REST APIs and UI
- Uses MongoDB for data persistence
- Uses Jenkins CI/CD pipeline for automation
- Uses Docker for containerization
- Automatically redeploys on every GitHub commit

This project demonstrates a real-world CI/CD workflow suitable for learning DevOps fundamentals.

---

## 🧠 How It Works (High-Level Flow)

1. **Developer** pushes code to GitHub
2. **GitHub Webhook** notifies Jenkins
3. **Jenkins Pipeline**:
   - Checks out the repository
   - Builds a Docker image for the app
   - Starts a MongoDB container
   - Runs the application container
4. **Application** becomes accessible via EC2 public IP

---

## 🛠️ Technologies Used

### Backend

- Node.js (ES Modules)
- Express.js
- MongoDB
- Mongoose
- EJS (for UI rendering)

### DevOps / Infrastructure

- Docker
- Jenkins (Pipeline as Code)
- GitHub Webhooks
- AWS EC2 (Linux)

---

## 📦 Technology Versions

| Technology | Version |
|------------|---------|
| Node.js    | 16.x    |
| MongoDB    | Latest (Docker Image) |
| Docker     | 20+     |
| Jenkins    | 2.x     |
| Express    | 4.x     |
| Mongoose   | 8.x     |

---

## 📁 Project Structure

```
.
├── app/
│   ├── controllers/
│   ├── routes/
│   ├── views/
│   ├── public/
├── server.js
├── package.json
├── Dockerfile
├── Jenkinsfile
└── README.md
```

---

## 🔁 CI/CD Pipeline (Jenkins)

The Jenkins pipeline performs the following stages:

1. **Checkout Code** – Pulls latest code from GitHub
2. **Build Docker Image** – Builds the Node.js app image
3. **Deploy MongoDB** – Runs MongoDB as a Docker container
4. **Deploy Application** – Runs the app container connected to MongoDB

MongoDB and the app communicate using a Docker network and container names.

---

## 🐳 Docker Setup

### Application Container

- Exposes port 3000
- Runs `server.js`
- Uses production dependencies only

### MongoDB Container

- Uses official `mongo` image
- Runs on port 27017
- Accessible via container name `mongodb`

---

## ▶️ How to Run Locally (Without Jenkins)

### 1️⃣ Clone the repository

```bash
git clone <repo-url>
cd <repo-name>
```

### 2️⃣ Install dependencies

```bash
npm install
```

### 3️⃣ Start MongoDB (Docker)

```bash
docker run -d --name mongodb -p 27017:27017 mongo
```

### 4️⃣ Run the app

```bash
node server.js
```

App will be available at:

```
http://localhost:3000
```

---

## ▶️ How to Run Using Docker Only

```bash
docker build -t todo-app .
docker run -d \
  --name todo-app \
  -p 3000:3000 \
  -e DB_URL=mongodb://mongodb:27017/todoapp \
  todo-app
```

---

## 🌐 Accessing the Application (Deployed)

Once Jenkins completes the pipeline:

```
http://<EC2-PUBLIC-IP>:3000
```

---

## 🔒 Environment Variables

| Variable | Description |
|----------|-------------|
| `DB_URL` | MongoDB connection string |
| `PORT`   | Application port (default: 3000) |

### Example:

```env
DB_URL=mongodb://mongodb:27017/todoapp
PORT=3000
```

---

## ✅ Key Learnings from This Project

- CI/CD using Jenkins Pipelines
- Docker container networking
- MongoDB container integration
- GitHub webhook automation
- Debugging real-world DevOps issues
- Running production-ready Node.js apps in Docker

---

## 📌 Future Improvements

- Add Docker volumes for MongoDB persistence
- Add health checks
- Add HTTPS using Nginx
- Use Docker Compose
- Secure secrets via Jenkins credentials
- Add automated tests

---

## 👤 Author

Built as a DevOps & CI/CD learning project using Jenkins, Docker, and AWS.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
