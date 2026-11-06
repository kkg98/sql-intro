-- Practice table for lesson 02 Queries: European stocks.
-- Numbers are illustrative (rounded / made up), not real market data.
-- Rebuild: run this script against data/stocks.db
DROP TABLE IF EXISTS stocks;

CREATE TABLE stocks (
   id INTEGER PRIMARY KEY,
   ticker TEXT,
   company TEXT,
   sector TEXT,
   country TEXT,
   price REAL,            -- share price in EUR
   pe_ratio REAL,         -- price / earnings
   dividend_yield REAL,   -- in %, NULL = pays no dividend
   year_listed INTEGER
);

INSERT INTO stocks VALUES
 (1,  'EBS',    'Erste Group',                     'Financials',  'Austria',      62.40,  9.1, 4.3, 1997),
 (2,  'RBI',    'Raiffeisen Bank International',  'Financials',  'Austria',      24.80,  4.5, NULL, 2005),
 (3,  'VIG',    'Vienna Insurance Group',          'Financials',  'Austria',      30.50,  8.7, 4.6, 1994),
 (4,  'OMV',    'OMV',                             'Energy',      'Austria',      45.10,  7.8, 6.5, 1987),
 (5,  'VER',    'Verbund',                         'Utilities',   'Austria',      68.90, 15.2, 3.9, 1988),
 (6,  'ANDR',   'Andritz',                         'Industrials', 'Austria',      58.20, 13.4, 4.1, 2001),
 (7,  'VOE',    'voestalpine',                     'Materials',   'Austria',      24.30, 11.9, 2.9, 1995),
 (8,  'WIE',    'Wienerberger',                    'Materials',   'Austria',      31.60, 16.8, 2.8, 1869),
 (9,  'POST',   'Oesterreichische Post',           'Industrials', 'Austria',      30.20, 15.0, 5.8, 2006),
 (10, 'TKA',    'Telekom Austria',                 'Telecom',     'Austria',       8.10,  9.8, 4.8, 2000),
 (11, 'PORR',   'Porr',                            NULL,          'Austria',      20.00,  9.0, 3.5, 1986),
 (12, 'SAP',    'SAP',                             'Technology',  'Germany',     245.00, 45.0, 1.0, 1988),
 (13, 'SIE',    'Siemens',                         'Industrials', 'Germany',     190.00, 18.5, 2.7, 1899),
 (14, 'ALV',    'Allianz',                         'Financials',  'Germany',     300.00, 12.0, 5.0, 1985),
 (15, 'DTE',    'Deutsche Telekom',                'Telecom',     'Germany',      31.00, 14.0, 2.9, 1996),
 (16, 'BAS',    'BASF',                            'Materials',   'Germany',      45.00, 20.0, 7.5, 1952),
 (17, 'VOW3',   'Volkswagen',                      'Consumer',    'Germany',      90.00,  4.0, 6.5, 1961),
 (18, 'ZAL',    'Zalando',                         'Consumer',    'Germany',      28.00, 25.0, NULL, 2014),
 (19, 'ASML',   'ASML Holding',                    'Technology',  'Netherlands', 650.00, 32.0, 1.0, 1995),
 (20, 'ADYEN',  'Adyen',                           'Technology',  'Netherlands',1450.00, 50.0, NULL, 2018),
 (21, 'MC',     'LVMH',                            'Consumer',    'France',      600.00, 24.0, 2.2, 1987),
 (22, 'TTE',    'TotalEnergies',                   'Energy',      'France',       56.00,  8.0, 5.5, 1991),
 (23, 'BNP',    'BNP Paribas',                     'Financials',  'France',       62.00,  7.0, 7.4, 1993),
 (24, 'AIR',    'Airbus',                          'Industrials', 'France',      160.00, 26.0, 1.2, 2000),
 (25, 'NESN',   'Nestle',                          'Consumer',    'Switzerland',  85.00, 17.0, 3.6, 1905),
 (26, 'NOVN',   'Novartis',                        'Healthcare',  'Switzerland',  95.00, 15.0, 3.7, 1996),
 (27, 'ROG',    'Roche Holding',                   'Healthcare',  'Switzerland', 260.00, 16.0, 3.8, 1920),
 (28, 'UBSG',   'UBS Group',                       'Financials',  'Switzerland',  27.00, 18.0, 2.6, 1998),
 (29, 'NOVO-B', 'Novo Nordisk',                    'Healthcare',  'Denmark',      60.00, 14.0, 3.0, 1974),
 (30, 'SPOT',   'Spotify Technology',              'Technology',  'Sweden',      500.00, 80.0, NULL, 2018),
 (31, 'CEZ',    'CEZ Group',                       'Utilities',   'Czechia',      40.00, 12.0, 6.0, 1993);
