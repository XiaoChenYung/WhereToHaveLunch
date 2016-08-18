DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS votes;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START 10000;

CREATE TABLE users
(
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  name        VARCHAR NOT NULL,
  password    VARCHAR NOT NULL
);

CREATE UNIQUE INDEX users_unique_name_idx ON users (name);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role    VARCHAR,
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE restaurants
(
    id    INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    name  VARCHAR NOT NULL
);

CREATE TABLE meals (
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  description TEXT NOT NULL,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurantss (id) ON DELETE CASCADE
);

CREATE TABLE votes (
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  user_id INTEGER UNIQUE NOT NULL,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY  (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY  (restaurant_id) REFERENCES restaurants (id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX users_unique_name_idx ON users (name);
