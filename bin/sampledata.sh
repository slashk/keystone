#!/bin/bash
# vim: tabstop=4 shiftwidth=4 softtabstop=4

# Copyright 2010 United States Government as represented by the
# Administrator of the National Aeronautics and Space Administration.
# Copyright 2011 OpenStack LLC.
# All Rights Reserved.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

# Tenants
./keystone-manage $* tenant add 1234
./keystone-manage $* tenant add ANOTHER:TENANT
./keystone-manage $* tenant add 0000
./keystone-manage $* tenant disable 0000

# Users
./keystone-manage $* user add joeuser secrete 1234
./keystone-manage $* user add admin secrete 1234
./keystone-manage $* user add disabled secrete 1234
./keystone-manage $* user disable disabled

# Roles
./keystone-manage $* role add Admin
./keystone-manage $* role grant Admin admin 1234

#BaseURLs
./keystone-manage $* baseURLs add DFW cloudFiles public.cloudfiles.com admin.cloudfiles.com internal.cloudfiles.com 1
# Groups
#./keystone-manage $* group add Admin 1234
#./keystone-manage $* group add Default 1234
#./keystone-manage $* group add Empty 0000

# User Group Associations
#./keystone-manage $* user joeuser join Default
#./keystone-manage $* user disabled join Default
#./keystone-manage $* user admin join Admin

# Tokens
./keystone-manage $* token add 887665443383838 joeuser 1234 2012-02-05T00:00
./keystone-manage $* token add 999888777666 admin 1234 2015-02-05T00:00
./keystone-manage $* token add 000999 admin 1234 2010-02-05T00:00
./keystone-manage $* token add 999888777 disabled 1234 2015-02-05T00:00
