-- ═══════════════════════════════════════════════════════════════════
-- SETUP: Resultados Académicos Tecnología – Colegio Cafam
-- Run this in: https://supabase.com/dashboard/project/adyfoagchuaneirouuon/sql
-- ═══════════════════════════════════════════════════════════════════

-- Table 1: Coordinator notes per student
CREATE TABLE IF NOT EXISTS tec_seguimiento (
  id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  codigo      TEXT NOT NULL UNIQUE,
  notas       JSONB NOT NULL DEFAULT '[]'::jsonb,
  updated_at  TIMESTAMPTZ DEFAULT now()
);

-- Table 2: Diversity School membership
CREATE TABLE IF NOT EXISTS tec_diversity (
  id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  codigo      TEXT NOT NULL UNIQUE
);

-- Enable Row Level Security (allow all for public key)
ALTER TABLE tec_seguimiento ENABLE ROW LEVEL SECURITY;
ALTER TABLE tec_diversity    ENABLE ROW LEVEL SECURITY;

-- Policies: allow full access with publishable key (anon role)
CREATE POLICY "allow_all_seguimiento" ON tec_seguimiento
  FOR ALL TO anon USING (true) WITH CHECK (true);

CREATE POLICY "allow_all_diversity" ON tec_diversity
  FOR ALL TO anon USING (true) WITH CHECK (true);

-- ═══════════════════════════════════════════════════════════════════
