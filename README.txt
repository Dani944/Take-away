SPICE N GRILL — FULL CLOUDFLARE ORDERING VERSION

Included:
- Customer menu/cart
- Checkout
- Delivery or pickup
- Cash payment option
- Browser GPS location capture
- D1 database schema
- Worker API
- Admin order dashboard
- Order status workflow
- Google Maps link from saved coordinates

CLOUDFLARE SETUP
1. Create a D1 database:
   npx wrangler d1 create spice-n-grill-db
2. Copy the returned database_id into wrangler.toml.
3. Run:
   npx wrangler d1 execute spice-n-grill-db --remote --file=schema.sql
4. Set admin secret:
   npx wrangler secret put ADMIN_TOKEN
5. Install Wrangler if needed:
   npm install -g wrangler
6. Login:
   wrangler login
7. Deploy:
   wrangler deploy

The deployed Pages/Workers URL serves the customer website at / and admin dashboard at /admin.html.
For production, protect the admin route with Cloudflare Access or another strong authentication layer. The simple ADMIN_TOKEN is intended for initial setup/testing.

PAYMENTS
Cash is implemented as the initial payment method. Online card/Benefit payment should be added only after choosing a payment provider and obtaining its API credentials.

LOCATION
The customer must grant browser location permission. The site stores latitude/longitude with the order. Customers can also type their address manually.

DELIVERY
The current module records delivery orders and location. A later phase can add delivery-driver accounts, assignment, delivery fees/zones, live tracking and notifications.
