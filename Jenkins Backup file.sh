#!/bin/bash

# Timestamp for the backup filename
timestamp=$(date +"%Y%m%d_%H%M%S")

# Jenkins directory to backup
jenkins_dir="/var/lib/jenkins"

# Backup directory
backup_dir="/var/backups/jenkins_backups"

# Tarball filename with timestamp
tarball_file="$backup_dir/jenkins_backup_$timestamp.tar.gz"

# AWS S3 bucket and key (replace with your own)
s3_bucket="your-s3-bucket"
s3_key="jenkins_backups/jenkins_backup_$timestamp.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Create a tarball of the Jenkins directory
tar -zcvf "$tarball_file" "$jenkins_dir"

# Upload the tarball to AWS S3
aws s3 cp "$tarball_file" "s3://$s3_bucket/$s3_key"

# Clean up (optional): Delete backups older than a certain number of days
find "$backup_dir" -type f -mtime +7 -exec rm {} \;
