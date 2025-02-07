-- Drop and recreate Users table (Example)

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS listings CASCADE;
DROP TABLE IF EXISTS favorites CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS messagelisting CASCADE;


CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  admin BOOLEAN NOT NULL DEFAULT FALSE,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  province VARCHAR(255) NOT NULL
);

CREATE TABLE listings (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  price INTEGER NOT NULL DEFAULT 0,
  year INTEGER NOT NULL DEFAULT 0,
  make VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  transmission BOOLEAN NOT NULL DEFAULT FALSE,
  color VARCHAR(255) NOT NULL,
  descriptions TEXT,
  sold BOOLEAN NOT NULL DEFAULT FALSE,
  imageURL VARCHAR(255) NOT NULL
);

CREATE TABLE favorites (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  listing_id INTEGER REFERENCES listings(id) ON DELETE CASCADE,
  favorited BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY NOT NULL,
  seller_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  listing_id INTEGER REFERENCES listings(id) ON DELETE CASCADE,
  buyer_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  messageReceived BOOLEAN NOT NULL DEFAULT FALSE,
  created_at INTEGER NOT NULL
);

CREATE TABLE messageListing (
  id SERIAL PRIMARY KEY NOT NULL,
  message_id INTEGER REFERENCES messages(id) ON DELETE CASCADE,
  sender_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  receiver_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  messageText TEXT,
  timeSent INTEGER NOT NULL
);
