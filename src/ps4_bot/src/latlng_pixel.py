import math
from geographic_msgs.msg import GeoPoint

OFFSET = 268435456 # half of the earth circumference's in pixels at zoom level 21
RADIUS = OFFSET / math.pi

def get_pixel( x, y, x_center, y_center, zoom_level):
    """
    x, y - location in degrees
    long lat
    x_center, y_center - center of the map
    zoom_level - same value as in the google static maps URL
    x_ret, y_ret - position of x, y in pixels relative to the center of the bitmap
    """
    x_ret = (lng_to_x(x) - lng_to_x(x_center)) >> (21 - zoom_level)
    y_ret = (lat_to_y(y) - lat_to_y(y_center)) >> (21 - zoom_level)
    return x_ret, y_ret

def lng_to_x( x):
    return int(round(OFFSET + RADIUS * x * math.pi / 180))

def lat_to_y( y):
    return int(round(OFFSET - RADIUS * math.log((1 + math.sin(y * math.pi / 180)) / (1 - math.sin(y * math.pi / 180))) / 2))

def x_to_lng( x):
    return ((x - OFFSET) /RADIUS * 180  / math.pi)

def y_to_lat( y):
    return math.asin(1 - (2/(math.exp((OFFSET - y) * 2 / RADIUS) + 1))) * 180 / math.pi

def get_latlng( x_ret, y_ret, x_center, y_center, zoom_level):
    """
    x_ret : x coordinate
    y_ret : y coordinate
    x_center : lng of the center of the maps
    y_center : lat of the center of the maps
    """
    
    diff_x = x_ret << (21- zoom_level)
    diff_y = y_ret << (21- zoom_level)
    x = diff_x + lng_to_x(x_center)
    y = diff_y + lat_to_y(y_center)

    lng = x_to_lng(x)
    lat = y_to_lat(y)
    
    return lat, lng

def mapping_Pixel_To_Geo(position, half_of_size_x, half_of_size_y, center):
    lat, lng = get_latlng(position[0] - half_of_size_x, position[1] - half_of_size_y, center.longitude, center.latitude, 19)
    return GeoPoint(lat, lng, 0.0)

def mapping_Geo_To_Pixel(geopoint, half_of_size_x, half_of_size_y, center):
    x_ret, y_ret = get_pixel(geopoint.longitude,geopoint.latitude, center.longitude, center.latitude, 19)
    return [x_ret + half_of_size_x, y_ret + half_of_size_y]