#!/bin/bash

recipient="recipient@example.com"
subject="Your Subject Here"

# Create a temporary file for the message
message_file="/tmp/email_message.txt"

echo "To: $recipient" > "$message_file"
echo "Subject: $subject" >> "$message_file"
echo "Your email message goes here." >> "$message_file"

# Send the email
sendmail "$recipient" < "$message_file"

# Clean up the temporary file
rm "$message_file"
