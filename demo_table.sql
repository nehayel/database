
CREATE TABLE demo_table (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(11),
    age INT CHECK(age >= 18),
    is_active BOOLEAN DEFAULT TRUE,
    city VARCHAR(50) DEFAULT 'dhaka',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    profile1 JSONB DEFAULT '{}'::JSONB,
    profile2 JSON DEFAULT '[]'::JSON,
    dress_color TEXT[] DEFAULT ARRAY[]::TEXT[],
    unique_number UUID DEFAULT gen_random_uuid() UNIQUE
);
