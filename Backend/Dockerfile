# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Collect static files
#RUN python manage.py collectstatic --noinput

# Run migrations
RUN python manage.py migrate

# Expose port 8000 for the Django development server
EXPOSE 8000

# Define the command to run on startup
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
