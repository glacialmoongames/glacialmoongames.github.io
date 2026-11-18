-- Execute uma vez em Supabase > SQL Editor.
-- As leituras do mural são públicas; gravação e upload só para esta conta.

create table if not exists public.studio_canvas (
  id integer primary key check (id = 1),
  elements jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.studio_canvas enable row level security;
grant select on public.studio_canvas to anon, authenticated;
grant insert, update, delete on public.studio_canvas to authenticated;

drop policy if exists "Public can view studio canvas" on public.studio_canvas;
create policy "Public can view studio canvas"
  on public.studio_canvas for select to anon, authenticated using (true);

drop policy if exists "Owner can insert studio canvas" on public.studio_canvas;
create policy "Owner can insert studio canvas"
  on public.studio_canvas for insert to authenticated
  with check (lower(auth.jwt() ->> 'email') = 'glacialmoongames@gmail.com');

drop policy if exists "Owner can update studio canvas" on public.studio_canvas;
create policy "Owner can update studio canvas"
  on public.studio_canvas for update to authenticated
  using (lower(auth.jwt() ->> 'email') = 'glacialmoongames@gmail.com')
  with check (lower(auth.jwt() ->> 'email') = 'glacialmoongames@gmail.com');

drop policy if exists "Owner can delete studio canvas" on public.studio_canvas;
create policy "Owner can delete studio canvas"
  on public.studio_canvas for delete to authenticated
  using (lower(auth.jwt() ->> 'email') = 'glacialmoongames@gmail.com');

insert into storage.buckets (id, name, public)
values ('studio-art', 'studio-art', true)
on conflict (id) do update set public = excluded.public;

drop policy if exists "Public can view studio art" on storage.objects;
create policy "Public can view studio art"
  on storage.objects for select to anon, authenticated
  using (bucket_id = 'studio-art');

drop policy if exists "Owner can upload studio art" on storage.objects;
create policy "Owner can upload studio art"
  on storage.objects for insert to authenticated
  with check (
    bucket_id = 'studio-art'
    and lower(auth.jwt() ->> 'email') = 'glacialmoongames@gmail.com'
  );

drop policy if exists "Owner can delete studio art" on storage.objects;
create policy "Owner can delete studio art"
  on storage.objects for delete to authenticated
  using (
    bucket_id = 'studio-art'
    and lower(auth.jwt() ->> 'email') = 'glacialmoongames@gmail.com'
  );

