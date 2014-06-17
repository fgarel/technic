#!/usr/bin/env python3

import json
import csv
import asyncio
import websockets


BUFFSIZE = 1 << 12
WS_SERVER, WS_PORT = 'localhost', 8765

def json_converter(gen):
    def wrapped(*args, **kwargs):
        return map(json.dumps, gen(*args, **kwargs))
    return wrapped


@json_converter
def csvfile_line_generator(filename, *, encoding='utf8'):
    """Read a CSV file and yeld each line"""
    with open(filename, encoding=encoding) as csvfile:
        dialect = csv.Sniffer().sniff(csvfile.read(BUFFSIZE))
        csvfile.seek(0)
        reader = csv.DictReader(csvfile, dialect=dialect)
        yield from reader


@asyncio.coroutine
def producer(websocket, uri):
    gen = csvfile_line_generator('comsimp2014.txt', encoding='latin1')
    for data in gen:
        if websocket.open:
            yield from websocket.send(data)

@asyncio.coroutine
def consumer():
    websocket = yield from websockets.connet(WS_URI)
    while websocket.open:
        yield from asyncio.sleep(1)
        data = yield from websocket.recv()
        print(">>> %s" % data)


if __name__ == '__main__':
    start_server = websockets.serve(producer, WS_SERVER, WS_PORT)
    asyncio.get_event_loop().run_until_complete(start_server)
    asyncio.get_event_loop().run_until_complete(consumer())
    asyncio.get_event_loop().run_forever()
