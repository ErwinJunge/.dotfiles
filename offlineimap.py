#!/usr/bin/env python2
from subprocess import check_output


def get_password(identifier):
    response = check_output(["pass", identifier])
    return response.decode().strip()
