# OsanpoRecord_2025

Walking / jogging diary application built with Ruby on Rails.

## Production URL
- https://osanpo.john-watanabe.com/tweets

---

## Features
- User authentication (Devise)
- Create walking / jogging records
- Attach multiple images to a post (ActiveStorage)
- Category / duration / intensity / rating using ActiveHash
- Calendar-based activity date

---

## Tech Stack
- Ruby: 3.2.0
- Rails: 7.1.6
- Database: MySQL
- Authentication: Devise
- Storage: Amazon S3 (ActiveStorage)
- Web Server: Nginx
- App Server: Puma (systemd)
- OS: Amazon Linux 2 (AWS EC2)

---

## Architecture (Production)

Client (Browser)  
→ Nginx (HTTPS / Reverse Proxy)  
→ Puma (127.0.0.1:3000)  
→ Rails Application  
→ MySQL  

Rails (ActiveStorage)  
→ Amazon S3  
(bucket: `osanporecord-2025-images`)

---

## Local Setup

```bash
git clone git@github.com:John-Willy-Brandt/OsanpoRecord_2025.git
cd OsanpoRecord_2025
bundle install
rails db:create db:migrate
rails s

## Operations (EC2)
ssh -i ~/.ssh/osanpo-rescue ec2-user@13.159.59.87

### Puma
```bash
sudo systemctl status puma
sudo systemctl restart puma
sudo journalctl -u puma -n 100 -o cat

### Nginx

sudo systemctl status nginx
sudo systemctl restart nginx
sudo nginx -t

## Troubleshooting

- 502 Bad Gateway  
  → Puma stopped / Nginx proxy mismatch

- 500 unable to sign request without credentials  
  → AWS_ACCESS_KEY_ID / SECRET missing

- Blocked hosts error  
  → Add domain to production.rb

- server.pid exists  
  → Remove tmp/pids/server.pid

