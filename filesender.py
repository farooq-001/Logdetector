import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders

# Email details
email_sender = 'babafarooq001@gmail.com'
email_receivers = ['babafarooq001@gmail.com', 'babafarooq9154@gmail.com']  # List of email addresses
email_subject = 'Sented'
smtp_server = 'smtp.gmail.com'
smtp_port = 587
smtp_username = 'babafarooq001@gmail.com'
smtp_password = 'glor fuby gbus rcal'
attachment_file = '/opt/blusapphire/snb-tech/Logdetector/logstash-8.9.0.tar.gz'

# Set up the MIME
msg = MIMEMultipart()
msg['From'] = email_sender
msg['To'] = ', '.join(email_receivers)
msg['Subject'] = email_subject

# Email body
body = "This is the body of the email."
msg.attach(MIMEText(body, 'plain'))

# Attach the file
with open(attachment_file, 'rb') as attachment:
    part = MIMEBase('application', 'octet-stream')
    part.set_payload(attachment.read())
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', f'attachment; filename={attachment_file.split("/")[-1]}')
    msg.attach(part)

# Connect to Gmail's SMTP server and send the email
try:
    server = smtplib.SMTP(smtp_server, smtp_port)
    server.starttls()  # Secure the connection
    server.login(smtp_username, smtp_password)
    text = msg.as_string()
    server.sendmail(email_sender, email_receivers, text)
    print("Email sent successfully!")
except Exception as e:
    print(f"Error: {e}")
finally:
    server.quit()
