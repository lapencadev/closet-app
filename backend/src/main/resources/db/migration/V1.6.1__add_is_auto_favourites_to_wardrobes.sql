-- Add is_auto_favourites to wardrobes table (Spotify-like favorites wardrobe)
ALTER TABLE wardrobes
ADD COLUMN is_auto_favourites BOOLEAN NOT NULL DEFAULT FALSE;

