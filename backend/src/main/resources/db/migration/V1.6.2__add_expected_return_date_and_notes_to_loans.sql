-- Add expected_return_date and notes to loans table for better tracking
ALTER TABLE loans
ADD COLUMN expected_return_date DATE,
ADD COLUMN notes TEXT;

