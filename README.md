# kinyaana

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# db

# profile structure main

create table public.profile (
  id uuid references auth.users(id) on delete cascade primary key,
  role text not null check (role in ('patient','doctor')),
  title text,
  first_name text,
  last_name text,
  gender text,
  age int,
  updated_at timestamp with time zone
);

# patient structure

create table public.patient (
  id uuid references public.profile(id) on delete cascade primary key,
  weight double,
  height double,
  ud text,
  dah text,
  fah text,
  pmh text
);

# doctor structure

create table public.doctor (
  id uuid references public.profile(id) on delete cascade primary key,
  specialty text,
  affiliation text,
  Institution text,
  experience text
);