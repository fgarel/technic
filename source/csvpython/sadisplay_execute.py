#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sadisplay
#from yourapp import model
import sadisplay_model as model

desc = sadisplay.describe([getattr(model, attr) for attr in dir(model)])
open('schema.plantuml', 'w').write(sadisplay.plantuml(desc))
open('schema.dot', 'w').write(sadisplay.dot(desc))

# Or only part of schema
desc = sadisplay.describe([model.User, model.Group, model.Permission])
open('auth.plantuml', 'w').write(sadisplay.plantuml(desc))
open('auth.dot', 'w').write(sadisplay.dot(desc))

