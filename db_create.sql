### Created By Dev Adnani

create table events (
  event_id bigint not null primary key,
  event_image text not null,
  event_type text not null,
  event_name text not null,
  event_location text not null,
  event_date text not null,
  event_charges integer not null
);

create table rooms (
  room_id bigint not null primary key,
  created_at text not null,
  room_name text not null,
  room_type text not null,
  room_address text not null,
  room_price integer not null,
  room_amenities_text ARRAY not null,
  room_photos ARRAY not null,
  room_status boolean not null,
  room_rating real not null,
  room_description text not null,
  room_amenities_image ARRAY not null,
  room_phone_call integer not null,
  room_lat double not null,
  room_long double not null
);

create table feedback (
  feedback_id bigint not null primary key,
  created_at text not null,
  feedback_title text not null,
  feedback_description text not null,
  feedback_stars real not null,
  user_id bigint not null
);

create table users (
  user_id bigint not null primary key,
  created_at text not null,
  user_name text not null,
  user_email text not null,
  user_password text not null,
  user_phone_no text not null,
  user_profile_url text
);

create table favourite (
  favourite_id bigint not null primary key,
  user_id bigint references users (user_id),
  room_id bigint references rooms (room_id)
);

create table bookings (
  bookings_id bigint not null primary key,
  room_id bigint references rooms (room_id),
  user_id bigint references users (user_id),
  booking_price bigint not null,
  booking_razorid character not null,
  booking_start_date character not null,
  booking_end_date character not null
);

create table events (
  event_id bigint not null primary key,
  event_image text not null,
  event_type text not null,
  event_name text not null,
  event_location text not null,
  event_date text not null,
  event_charges integer not null
);

create table rooms (
  room_id bigint not null primary key,
  created_at text not null,
  room_name text not null,
  room_type text not null,
  room_address text not null,
  room_price integer not null,
  room_amenities_text ARRAY not null,
  room_photos ARRAY not null,
  room_status boolean not null,
  room_rating real not null,
  room_description text not null,
  room_amenities_image ARRAY not null,
  room_phone_call integer not null,
  room_lat double not null,
  room_long double not null
);

create table feedback (
  feedback_id bigint not null primary key,
  created_at text not null,
  feedback_title text not null,
  feedback_description text not null,
  feedback_stars real not null,
  user_id bigint not null
);

create table users (
  user_id bigint not null primary key,
  created_at text not null,
  user_name text not null,
  user_email text not null,
  user_password text not null,
  user_phone_no text not null,
  user_profile_url text
);

create table favourite (
  favourite_id bigint not null primary key,
  user_id bigint references users (user_id),
  room_id bigint references rooms (room_id)
);

create table bookings (
  bookings_id bigint not null primary key,
  room_id bigint references rooms (room_id),
  user_id bigint references users (user_id),
  booking_price bigint not null,
  booking_razorid character not null,
  booking_start_date character not null,
  booking_end_date character not null
);

