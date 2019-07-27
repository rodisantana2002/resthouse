class Config(object):
    DEBUG = False
    TESTING = False
    DATABASE_URI = 'postgres://slgbapiwlblkgw:8430dc6f67f50a7d333656b1aa792b7c3549052e51bc6a464e134fae63236b03@ec2-174-129-41-127.compute-1.amazonaws.com:5432/dfcitm8gug7cja'


class ProductionConfig(Config):
    DATABASE_URI = 'postgres://slgbapiwlblkgw:8430dc6f67f50a7d333656b1aa792b7c3549052e51bc6a464e134fae63236b03@ec2-174-129-41-127.compute-1.amazonaws.com:5432/dfcitm8gug7cja'


class DevelopmentConfig(Config):
    DEBUG = True


class TestingConfig(Config):
    TESTING = True
