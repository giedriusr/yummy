# geocoding service (see below for supported options):
Geocoder::Configuration.lookup = :google

# to use an API key:
Geocoder::Configuration.api_key = 'AIzaSyDD_2hCxnDziK44iX9v1E5UoJyP5lS5j6Y'

# caching (see below for details)
Geocoder::Configuration.cache = Redis.new
Geocoder::Configuration.cache_prefix = 'geocoder'