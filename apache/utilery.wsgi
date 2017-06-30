import os
import sys
os.chdir(os.path.dirname(__file__))
new_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'utilery')
sys.path.append(new_path)
sys.path.append(os.path.realpath('../utilery/'))

os.environ['UTILERY_SETTINGS'] = '/srv/utilery_conf/utilery_conf.py'

from utilery.views import app

application = app
