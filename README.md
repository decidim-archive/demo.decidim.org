# demo_decidim_org

Citizen Participation and Open Government application.

Demo application, being used on: 
* https://try.decidim.org
* https://demo.decidim.org
* https://nightly.decidim.org

This is the open-source repository for demo_decidim_org, based on [Decidim](https://github.com/decidim/decidim).

## Installation

You can install it with Docker and Docker Compose, with these commands:

```bash
git clone https://github.com/decidim/demo.decidim.org
cd demo.decidim.org
cp .env.example .env
docker-compose up -d
docker-compose run --rm exec app rails db:seed
```

