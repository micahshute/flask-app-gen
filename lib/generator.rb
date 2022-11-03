


class Generator

    SETUP = <<-python
from setuptools import setup, find_packages

with open('README.md') as f:
    readme = f.read()

with open('LICENSE') as f:
    license = f.read()

setup(
    name='PROJECT_NAME',
    version='0.1.0',
    description='PROJECT_DESCRIPTION',
    long_description=readme,
    author='AUTHOR_NAME',
    author_email='AUTHOR_EMAIL',
    url='REPO_URL',
    license=license,
    packages=find_packages(exclude=('tests', 'docs'))
)
    python

    MIT_LICENSE = <<-TXT
The MIT License (MIT)

Copyright (c) 2020 TODO: Write your name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.    
    TXT

    CLOSED_SOURCE_LICENSE = <<-TXT
/* Copyright (C) COMPANY - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
* Written by NAME <EMAIL>, DATE
*/
    TXT

    MAKEFILE = <<-TXT
init:
	pip3 install -r requirements.txt

test:
	nosetests tests

    TXT

    GITIGNORE = <<-TXT
*.pyc
__pycache__
    TXT


    MAIN = <<-python
import sys

def main():
    """Main entry point for the script."""
    pass

if __name__ == '__main__':
    sys.exit(main())

    python

    FLASK_INIT = <<-python

import os

from flask import Flask
import app.views.home as home

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    app.register_blueprint(home.bp)

    return app
    python

    FLASK_README = <<-MD
# RUN LOCALLY: 

```bash
export FLASK_APP=app
export FLASK_ENV=development
python3 -m flask run
```    
# RUN WITH DOCKER
```bash
docker build -t <desired_image_name> .
docker container run --name <desired_container_name> -p 80:80 <name_from_above_step>
```

# Endpionts:
/hello
/home/hello_world
    MD

    FLASK_VIEW = <<-python
import functools
from flask import Blueprint, jsonify, request

bp = Blueprint('home', __name__, url_prefix="/home")

@bp.route('/hello_world', methods=["GET"])
def hello_world():
    return jsonify({"msg": "hello world!"})
    python

    FLASK_MAIN = <<-python
import os
import sys

sys.path.append('./app')

from app import create_app

app = create_app()
    python

    FLASK_DOCKERFILE = <<-Dockerfile
FROM tiangolo/uwsgi-nginx-flask:python3.8

RUN apt-get update && \
    pip3 install --upgrade pip 

COPY ./ /app

    Dockerfile

    FLASK_UWSGI = <<-uwsgi
[uwsgi]
module = main
callable = app
master = true
enable-threads = true
harakiri-verbose = true

    uwsgi

    RUN_TESTS_SCRIPT = <<-script
#!/bin/bash
python3 -m unittest -v

    script

    UNITTEST_EXAMPLE = <<-python
import unittest

class ExampleTest(unittest.TestCase):
    def test_example(self):
        self.assertTrue(False)

    python



    def self.create_project_files
        print "Enter project name: "
        project_name = STDIN.gets.strip
        puts
        Dir.mkdir(project_name)
        dir = "#{Dir.pwd}/#{project_name}"
        Dir.mkdir("#{dir}/test")
        File.write("#{dir}/test/__init__.py", "")
        File.write("#{dir}/test/test_example.py", UNITTEST_EXAMPLE)
        File.write("#{dir}/run_tests", RUN_TESTS_SCRIPT)
        Dir.mkdir("#{dir}/lib")
        File.write("#{dir}/setup.py", SETUP)
        File.write("#{dir}/Makefile", MAKEFILE)
        File.write("#{dir}/.gitignore", GITIGNORE)
        File.write("#{dir}/README.md", "##{project_name}")
        File.write("#{dir}/requirements.txt", "")
        File.write("#{dir}/main.py", MAIN)
        puts "\n\nType 1 for open-source license or 2 for closed-source license\n\n"
        license_type = STDIN.gets.strip.to_i
        while !license_type.between?(1,2)
            print "\n\nType 1 for open-source license or 2 for closed-source license: "
            license_type = gets.strip.to_i
            puts
            puts
        end
        case license_type
        when 1
            File.write("#{dir}/LICENSE", MIT_LICENSE)
        when 2
            print "Compnay Name:  "
            company = STDIN.gets.strip
            print "\nAuthor:  "
            name = STDIN.gets.strip
            print "\nEmail:  "
            email = STDIN.gets.strip
            date = Time.now.strftime("%b %Y")
            data = {
                "COMPANY" => company,
                "NAME" => name,
                "EMAIL" => email,
                "DATE" => date
            }
            license = Parser.insert_data(CLOSED_SOURCE_LICENSE, data)
            File.write("#{dir}/LICENSE", license)
        else
            throw StandardError.new("This should not be possible")
        end

    end


    def self.create_flask_application
        print "Enter project name: "
        project_name = STDIN.gets.strip
        puts
        Dir.mkdir("#{Dir.pwd}/#{project_name}")
        base_dir = "#{Dir.pwd}/#{project_name}"
        Dir.mkdir("#{base_dir}/app")
        File.write("#{base_dir}/app/__init__.py", FLASK_INIT)
        File.write("#{base_dir}/README.md", FLASK_README)
        Dir.mkdir("#{base_dir}/app/views")
        File.write("#{base_dir}/app/views/home.py", FLASK_VIEW)
        File.write("#{base_dir}/main.py", FLASK_MAIN)
        File.write("#{base_dir}/Dockerfile", FLASK_DOCKERFILE)
        File.write("#{base_dir}/uwsgi.ini", FLASK_UWSGI)
    end


    def self.create_embedded_flask_application
        print "Enter project name: "
        project_name = STDIN.gets.strip
        puts
        Dir.mkdir("#{Dir.pwd}/#{project_name}")
        dir = "#{Dir.pwd}/#{project_name}"
        Dir.mkdir("#{dir}/app")
        File.write("#{dir}/app/__init__.py", FLASK_INIT)
        File.write("#{dir}/README.md", FLASK_README)
        Dir.mkdir("#{dir}/app/views")
        File.write("#{dir}/app/views/home.py", FLASK_VIEW)
        File.write("#{dir}/main.py", FLASK_MAIN)
        File.write("#{dir}/Dockerfile", FLASK_DOCKERFILE)
        File.write("#{dir}/uwsgi.ini", FLASK_UWSGI)
        Dir.mkdir("#{dir}/test")
        File.write("#{dir}/test/__init__.py", "")
        File.write("#{dir}/test/test_example.py", UNITTEST_EXAMPLE)
        File.write("#{dir}/run_tests", RUN_TESTS_SCRIPT)
        Dir.mkdir("#{dir}/lib")
        File.write("#{dir}/setup.py", SETUP)
        File.write("#{dir}/Makefile", MAKEFILE)
        File.write("#{dir}/.gitignore", GITIGNORE)
        File.write("#{dir}/README.md", "##{project_name}")
        File.write("#{dir}/requirements.txt", "")
        puts "\n\nType 1 for open-source license or 2 for closed-source license\n\n"
        license_type = STDIN.gets.strip.to_i
        while !license_type.between?(1,2)
            print "\n\nType 1 for open-source license or 2 for closed-source license: "
            license_type = gets.strip.to_i
            puts
            puts
        end
        case license_type
        when 1
            File.write("#{dir}/LICENSE", MIT_LICENSE)
        when 2
            print "Compnay Name:  "
            company = STDIN.gets.strip
            print "\nAuthor:  "
            name = STDIN.gets.strip
            print "\nEmail:  "
            email = STDIN.gets.strip
            date = Time.now.strftime("%b %Y")
            data = {
                "COMPANY" => company,
                "NAME" => name,
                "EMAIL" => email,
                "DATE" => date
            }
            license = Parser.insert_data(CLOSED_SOURCE_LICENSE, data)
            File.write("#{dir}/LICENSE", license)
        else
            throw StandardError.new("This should not be possible")
        end
    end

end