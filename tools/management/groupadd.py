#!/usr/bin/env python
# Copyright (c) 2010-2011 OpenStack, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import sys

# If ../keystone/__init__.py exists, add ../ to Python search path, so that
# it will override what happens to be installed in /usr/(local/)lib/python...
possible_topdir = os.path.normpath(os.path.join(os.path.abspath(sys.argv[0]),
                                   os.pardir,
                                   os.pardir))
if os.path.exists(os.path.join(possible_topdir, 'keystone', '__init__.py')):
    sys.path.insert(0, possible_topdir)

import optparse
import keystone.db.sqlalchemy.api as db_api
from keystone.db.sqlalchemy import models


def main():
    usage = "usage: %prog group_id group_desc"
    parser = optparse.OptionParser(usage)
    options, args = parser.parse_args()
    if len(args) != 2:
        parser.error("Incorrect number of arguments")
    else:
        group_id = args[0]
        group_desc = args[1]
        try:
            g = models.Group()
            g.id = group_id
            g.desc = group_desc
            db_api.group_create(g)
            print 'Group', g.id, 'created.'
        except Exception, e:
            print 'Error creating group', group_id, ':', str(e)

if __name__ == '__main__':
    main()
