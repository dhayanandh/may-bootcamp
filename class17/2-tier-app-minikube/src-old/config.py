import os

class Config:
    # SQLALCHEMY_DATABASE_URI = os.getenv('DB_LINK')
    SQLALCHEMY_DATABASE_URI = 'postgresql://postgres:admin1234@student-portal.cvik8accw2tk.ap-south-1.rds.amazonaws.com:5432/mydb'
    SQLALCHEMY_TRACK_MODIFICATIONS = False