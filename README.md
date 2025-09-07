## ⚙️ Local Development Setup

Before you begin, ensure you have the following software installed on your development machine:
- Node.js (with npm)
- Java Development Kit (JDK)
- MySQL Server

#### 1. Backend Setup
The backend consists of a Java Spring Boot application and a Node.js service.

**A. Java (Spring Boot) Service:**
1.  Open the Java project directory in your preferred IDE (e.g., IntelliJ IDEA, Eclipse).
2.  **[CRITICAL STEP]** Manually add the following four `.jar` files to the project's classpath (e.g., by creating a `libs` folder and adding them as dependencies):
    - `aHigh_Sole.jar`
    - `aSole_TopogyThickness.jar`
    - `create_local_coordinate.jar`
    - `javabuilder.jar`
3.  Configure the database connection in the `application.properties` or `application.yml` file with your local MySQL URL, username, and password.

**B. Node.js Service:**
1.  Navigate to the Node.js backend service directory.
    ```bash
    # Example: cd server/nodejs_service
    ```
2.  Install the required npm packages.
    ```bash
    npm install
    ```

#### 2. Frontend Setup
1.  Navigate to the frontend application directory.
    ```bash
    # Example: cd client
    ```
2.  Install the required npm packages.
    ```bash
    npm install
    ```

#### 3. Database Setup
1.  Ensure your local MySQL server is running.
2.  Create a new database for the application (e.g., `2os_sole_db`).
3.  If an initial data script (`.sql` file) is provided, import it into the newly created database.


## 🛠️ Running the Application

To run the full application locally, you must start all services.

1.  **Start the Backend Services:**
    - Launch the Java Spring Boot application from your IDE or by using a Maven/Gradle command (e.g., `mvn spring-boot:run`).
    - Start the Node.js service from its directory (e.g., `npm run dev` or `node index.js`).

2.  **Start the Frontend Client:**
    - In a new terminal, navigate to the frontend directory and run the start command.
    ```bash
    # Example command
    npm start
    ```

3.  **Access the Project:**
    - Once all services are running without errors, open your web browser and navigate to the frontend's local address (typically `http://localhost:3000`).

## 📦 Deployment

This application is designed to be deployed on an **Apache Tomcat** server.

The standard deployment process is as follows:
1.  Build the Java Spring Boot project into a `.war` (Web Application Archive) file.
2.  Deploy the generated `.war` file to the `webapps` directory of your Tomcat server.
3.  Tomcat will automatically unpack and run the application.

*Note: The frontend application should be built into static files (using `npm run build`) and served by the backend or a dedicated web server like Nginx for production environments.*
