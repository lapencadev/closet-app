-- Add type to accessories table (enum: bag, belt, hat, scarf, jewellery, sunglasses, watch, gloves, socks, tights, bow_tie, tie, brooch, hair_accessory, backpack, wallet)
ALTER TABLE accessories
ADD COLUMN type VARCHAR(50);


