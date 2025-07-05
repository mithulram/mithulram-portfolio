# EmailJS Setup Instructions

## To make the contact form work, you need to set up EmailJS:

### 1. Sign up for EmailJS
- Go to [https://www.emailjs.com/](https://www.emailjs.com/)
- Create a free account

### 2. Create an Email Service
- In EmailJS dashboard, go to "Email Services"
- Add a new service (Gmail, Outlook, etc.)
- Configure it to send emails to: **gmithulram@gmail.com**
- Note down the **Service ID**

### 3. Create an Email Template
- Go to "Email Templates"
- Create a new template
- **IMPORTANT**: In the template settings, set the "To Email" field to: `gmithulram@gmail.com`
- Use these variables in your template:
  - `{{to_name}}` - Your name (Mithul)
  - `{{to_email}}` - Your email (gmithulram@gmail.com)
  - `{{from_name}}` - Name of the person sending the message
  - `{{from_email}}` - Email of the person sending the message
  - `{{reply_to}}` - Email address to reply to (same as from_email)
  - `{{message}}` - The message content
  - `{{subject}}` - Email subject
- Note down the **Template ID**

### 4. Get Your Keys
- Go to "Account" → "API Keys"
- Copy your **Public Key** and **Private Key**

### 5. Create the .env file
Create a `.env` file in your project root with your actual credentials:

```
EMAIL_JS_SERVICE_ID=your_actual_service_id
EMAIL_JS_TEMPLATE_ID=your_actual_template_id
EMAIL_JS_PUBLIC_KEY_ID=your_actual_public_key
EMAIL_JS_PRIVATE_KEY_ID=your_actual_private_key
```

### 6. Test the Contact Form
- Restart your Flutter app
- Go to the Contact section
- Fill out the form and test sending a message

## Example Email Template:
```
Subject: {{subject}}

Hi {{to_name}},

You have received a new message from your portfolio website:

Name: {{from_name}}
Email: {{from_email}}

Message:
{{message}}

---
This message was sent from your portfolio contact form.
You can reply directly to this email to respond to {{from_name}}.
```

## Important Notes:
- The email will be sent TO: gmithulram@gmail.com
- **Make sure to set the "To Email" field in your EmailJS template to: gmithulram@gmail.com**
- The reply_to field is set to the sender's email so you can reply directly
- Make sure your EmailJS service is configured to send emails to gmithulram@gmail.com

## Troubleshooting:
- Check the browser console for any error messages
- Make sure all environment variables are properly set in the .env file
- Verify your EmailJS service is active
- Check that your template variables match the ones used in the code
- Ensure the .env file is in the project root directory 