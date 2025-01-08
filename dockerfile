# official Python 3.12 slim image
FROM python:3.12-slim

# working directory in the container
WORKDIR /myapp

# Copy only the requirements file first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the port 
EXPOSE 5000

# command to run the application
CMD ["python", "app.py"]
