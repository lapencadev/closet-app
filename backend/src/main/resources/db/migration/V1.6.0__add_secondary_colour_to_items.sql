-- Add secondary_colour to items table for multi-color support
ALTER TABLE items
ADD COLUMN secondary_colour VARCHAR(20);

